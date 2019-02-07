# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=hashbrowns-git
pkgver=0.18.5a3aeb2
pkgrel=1
pkgdesc='Provides cryptographic hashes with a minimal UI'
url='https://github.com/gavinhungry/hashbrowns'
license=('MIT')
arch=('any')
makedepends=('git')
depends=('pygtk' 'pango' 'python2-pysha3')
source=("${pkgname}::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "$pkgdir"/usr/bin

  install -m 755 hashbrowns.py "$pkgdir"/usr/bin/hashbrowns
}
