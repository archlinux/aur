# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
pkgname=ykchalresp-nfc
pkgver=0.1.1
pkgrel=1
pkgdesc="Perform challenge response using YubiKey via NFC"
arch=('x86_64' 'i686')
url="https://github.com/Frederick888/ykchalresp-nfc"
license=('GPL3')
source=("https://github.com/Frederick888/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('dfeb053d157f89e9ddcfb508e760d37f5d2fa062bb354d5d3044f93fd97dd161')
depends=('libnfc')
makedepends=('cmake' 'gengetopt')

build() {
    mkdir -p "$pkgname-$pkgver/build" && cd $_
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    install -Dm755 "$pkgname-$pkgver/build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
