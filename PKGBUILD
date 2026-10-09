# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=wtfi2-bin
_pkgname=wtfi2
pkgver=0.6.0
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
sha256sums_x86_64=('cc38559d9d7718c59f0fb575945dbb245b04ab164b39c3c29eb7a858494e3d2b')
sha256sums_aarch64=('681f3d3b1db53ac4a88a6707a87adb9cc975c36f550654ce30a5bbc726fd3d56')

package() {
    cd "wtfi2-$CARCH-unknown-linux-gnu"
    install -Dm0755 wtfi "$pkgdir/usr/bin/wtfi"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
