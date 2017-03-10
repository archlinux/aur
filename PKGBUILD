# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=streameye
pkgver=0.8
pkgrel=1
pkgdesc="A simple MJPEG streamer for Linux"
arch=("any")
url="https://github.com/ccrisan/streameye"
license=("GPL3")
depends=("python2" "python-picamera")
makedepends=("git" "make" "gcc")
source=("https://github.com/ccrisan/streameye/archive/${pkgver}.tar.gz")
sha256sums=('6dbda8147ef2701ad57f816f3ecdcd72c4b31b12c286c7a2eed5405421a06dbf')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 755 streameye "${pkgdir}/usr/bin/streameye"
    install -Dm 755 extras/raspimjpeg.py "${pkgdir}/usr/bin/raspimjpeg.py"
}
