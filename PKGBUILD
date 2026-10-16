# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=wtfi2-bin
_pkgname=wtfi2
pkgver=0.7.0
pkgrel=1
pkgdesc='Live, visual network-path diagnostic that pinpoints exactly where your Wi-Fi connection dies'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/kanywst/wtfi2'
license=('MIT')
options=(
    '!lto'
    '!debug'
)
provides=('wtfi')
conflicts=('wtfi2-git' 'wtfi2')
source_x86_64=("${_pkgname}-bin-${pkgver}.tar.xz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${_pkgname}-bin-${pkgver}.tar.xz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('d6c61f166e2d575eab58c2368b84c4c4def4c5264042518013edb88a24200baf')
sha256sums_aarch64=('613ef06797ca8bbf74bfd04167055a2c9228e33be3e267df7852d5c9e86edefd')

package() {
    cd "wtfi2-$CARCH-unknown-linux-gnu"
    install -Dm0755 wtfi "$pkgdir/usr/bin/wtfi"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
