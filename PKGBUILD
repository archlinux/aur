# Maintainer: Sky Aw <sky100aw@gmail.com>

pkgname=fetchpac-git
pkgver=1.1.r7.gd26f5af
pkgrel=1
pkgdesc="A CLI tool written in Bash for printing system package information."
arch=('any')
url="https://github.com/sky-aw/fetchpac"
license=('GPL')
depends=('bash')
makedepends=('git')
source=("$pkgname::git+https://github.com/sky-aw/fetchpac.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
