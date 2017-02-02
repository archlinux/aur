# Maintainer: Frantisek Fladung <ametisf@gmail.com>

pkgname=dstatus-git
pkgver=0.0.1.r0.gdc46792
pkgrel=1
pkgdesc="status bar for velox"
arch=('i686' 'x86_64')
url="https://github.com/ametisf/dstatus"
license=('MIT')
depends=('swc' 'velox')
optdepends=('terminus-font: bitmap font for nicer rendering')
source=("$pkgname::git+https://github.com/ametisf/dstatus.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    make ENABLE_DEBUG=0
}

package() {
    cd $pkgname
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
