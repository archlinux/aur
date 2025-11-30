pkgname=sph-utils-git
pkgver=c73f71b
pkgrel=1
pkgdesc='basic file, shell and text manipulation utilities'
arch=('x86_64')
url='https://github.com/sph-mn/sph-utils'
license=('GPL3')
depends=()
makedepends=('git' 'gcc')
provides=('sph-utils')
conflicts=('sph-utils')
source=('git+https://github.com/sph-mn/sph-utils.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/sph-utils"
  if git describe --tags --long >/dev/null 2>&1; then
    git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/./g'
  else
    git rev-parse --short HEAD
  fi
}

build() {
  cd "$srcdir/sph-utils"
  sh ./exe/compile
}

package() {
  cd "$srcdir/sph-utils"
  sh ./exe/install "$pkgdir/usr"
}
