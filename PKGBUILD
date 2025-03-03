# Maintainer: trilader <trilader@schroedingers-bit.net>
pkgname=m8c
pkgver=1.7.10
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
md5sums=('4ee7ac8615a272a8a832ae822fe941c7')
sha256sums=('c0e046fccbff27b5bfde552d7944f6a0317d386d4f6a816838b5249e58cece49')

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



