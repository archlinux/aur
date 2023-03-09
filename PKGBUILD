# Maintainer: trilader <trilader@schroedingers-bit.net>
pkgname=m8c
pkgver=1.4.0
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
md5sums=('872bc52723e10b2a113970c79b3596e3')
sha256sums=('acb7f28a1426db26062f31e6052412ab04cec81daa85951546565ce4d0b695f5')

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



