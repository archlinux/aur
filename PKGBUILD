# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=mdl
pkgver=1.1.2
pkgrel=3
epoch=1
pkgdesc="MarkDown Less is a Markdown displayer"
arch=('x86' 'x86_64')
url='https://github.com/dopsi/mdl'
license=('MIT')
provides=('mdl')
conflicts=('MDL')
depends=('boost-libs')
makedepends=('cmake' 'boost')
source=("http://github.com/dopsi/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('247456ed4a8a55ea879a81b87b17e72bc0549f01')

build() {
    cd "${srcdir}/mdl-${pkgver}"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/mdl-${pkgver}/build"
    make DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp ../LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:ts=4:sw=4:expandtab
