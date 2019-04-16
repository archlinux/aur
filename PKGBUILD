# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
pkgname=ykchalresp-nfc
pkgver=0.1.0
pkgrel=1
pkgdesc="Perform challenge response using YubiKey via NFC"
arch=('x86_64' 'i686')
url="https://github.com/Frederick888/ykchalresp-nfc"
license=('GPL3')
source=("https://github.com/Frederick888/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('aecd2fffb8a6fec186669dfbe682046bcd42a842bc84f0b7e5337172df25aa04')
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
