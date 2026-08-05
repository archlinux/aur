# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=zsign-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Fast cross-platform iOS code signing tool — codesign alternative without Xcode/macOS"
arch=('x86_64')
url="https://github.com/zhlynn/zsign"
license=('MIT')
depends=('openssl' 'gcc-libs')
options=('!debug')
provides=('zsign')
conflicts=('zsign')
source=("zsign-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/zsign-linux-x86_64.tar.gz"
        "LICENSE-v${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE")
sha256sums=('65873b256b8902715cc81c8c467e9dddb315a2b484c6d0f5fb2031bad819d8ba'
            'SKIP')

package() {
    install -Dm755 zsign "$pkgdir/usr/bin/zsign"
    install -Dm644 "$srcdir/LICENSE-v${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
