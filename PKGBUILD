# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=wtfi2-bin
_pkgname=wtfi2
pkgver=0.10.0
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
install=wtfi2.install
source=(
    'wtfi-record.service'
    'wtfi2.install'
)
source_x86_64=("${_pkgname}-bin-${pkgver}.tar.xz::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${_pkgname}-bin-${pkgver}.tar.xz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.xz")
sha256sums=(
    '4f478213f9a82b9653ee81b9d939c7d0e407d86c42c1cd4390ded6847eb15b39'
    'fca82538ba506d7d4c01d3e587a68a6cea767bdf9ab444eccf969ef8684d1b1e'
)
sha256sums_x86_64=('783c9247e63edf7d009f121a0180fd954a931298deda0c6b3256f561b353a332')
sha256sums_aarch64=('ce3558083c5d833c8936dac678e1fa657823ab39d95822c355acaba518603f58')

package() {
    cd "wtfi2-$CARCH-unknown-linux-gnu"
    install -Dm0755 wtfi "$pkgdir/usr/bin/wtfi"
    install -Dm644 ../wtfi-record.service "$pkgdir/usr/lib/systemd/system/wtfi-record.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
