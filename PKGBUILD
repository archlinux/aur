# Maintainer: Frantisek Fladung <ametisf@gmail.com>

pkgname=dstatus-git
pkgver=0.0.1.r12.geac3bbf
pkgrel=1
pkgdesc="status bar for velox"
arch=('i686' 'x86_64')
url="https://github.com/ametisf/dstatus"
license=('MIT')
depends=('swc' 'velox')
makedepends=('tup')
optdepends=('terminus-font: bitmap font for nicer rendering')
source=("$pkgname::git+https://github.com/ametisf/dstatus.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    tup init
    tup upd
}

package() {
    mkdir -p $pkgdir/usr/bin
    install -m 755 $pkgname/dstatus $pkgdir/usr/bin
}
