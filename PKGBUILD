# Maintainer: trilader <trilader@schroedingers-bit.net>
pkgname=m8c
pkgver=1.5.2
pkgrel=1
pkgdesc="A UI for the M8 and M8 Headless portable music DAWs"
arch=('x86_64')
url="https://github.com/laamaa/m8c"
license=('MIT')
depends=('sdl2' 'libserialport')
makedepends=()
checkdepends=()
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/laamaa/m8c/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('0f23ac43391212d4300ead380de97a3f')
sha256sums=('f6942deffea0d1686b3a4bc5076dde667dd8c06320a1bf65e7e48082931eabcc')

build() {
    cd $srcdir/$pkgname-$pkgver
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make PREFIX=/usr DESTDIR=$pkgdir install
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 AUDIOGUIDE.md "${pkgdir}/usr/share/doc/${pkgname}/AUDIOGUIDE.md"
    install -Dm 644 gamecontrollerdb.txt "${pkgdir}/usr/share/doc/${pkgname}/gamecontrollerdb.txt"
}



