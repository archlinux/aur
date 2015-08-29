# Maintainer: Gil Forsyth <gilforsyth@gmail.com> 

pkgname=xrectsel
pkgver=0.3.1
pkgrel=1
pkgdesc="a small program that tells you the geometry of a rectangular screen region selected with the mouse"
license=('GPL3')
arch=('i686' 'x86_64')
url="https://github.com/lolilolicon/xrectsel"
source=("https://github.com/lolilolicon/xrectsel/archive/$pkgver.tar.gz")
md5sums=('SKIP')
depends=('libx11')

build() {
    tar xzf "${pkgver}.tar.gz"
    cd "${pkgname}-${pkgver}"
    ./bootstrap
    ./configure --prefix /usr
    make
}
package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 xrectsel "${pkgdir}"/usr/bin/xrectsel
}

