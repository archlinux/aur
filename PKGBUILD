# Maintainer: Tomek Łaziuk <tlaziuk@gmail.com>

_pkgname=modman
pkgname=$_pkgname-git
pkgver=1.12.r31.g799fbd1
pkgrel=2
pkgdesc="Magento Module Manager"
arch=("any")
url="https://github.com/colinmollenhour/${_pkgname}"
license=('GPL')
depends=('bash')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/colinmollenhour/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${_pkgname}"

  install -Dm664 README.md       "$pkgdir/usr/share/doc/${_pkgname}/README.md"
  install -Dm664 bash_completion "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm755 $_pkgname        "$pkgdir/usr/bin/${_pkgname}"
}
