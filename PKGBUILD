# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=orca-rs
pkgver=0.1.1
pkgrel=1
pkgdesc="Orca live coding environment, ported to Rust (terminal UI with MIDI/OSC/UDP output)"
arch=('x86_64' 'aarch64')
url="https://prosjekt.klingenbergbygg.no/bl/orca-rs"
license=('MIT')
depends=('alsa-lib')
optdepends=(
    'pipewire-alsa: expose the MIDI port through PipeWire'
)
provides=('orca-rs')
conflicts=('orca-rs-git' 'orca-rs-bin')
source_x86_64=("orca-rs-v${pkgver}-x86_64.tar.gz::https://prosjekt.klingenbergbygg.no/bl/orca-rs/releases/download/v${pkgver}/orca-rs-v${pkgver}-x86_64.tar.gz")
source_aarch64=("orca-rs-v${pkgver}-aarch64.tar.gz::https://prosjekt.klingenbergbygg.no/bl/orca-rs/releases/download/v${pkgver}/orca-rs-v${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('9aa5ce206fb30a99cf694b800baed6384f44d876f668dbb2edb2e568e99c058a')
sha256sums_aarch64=('2370f39bf748dd9b34d8b786942d11542d47c95b1fac3256343401296ea288f7')

package() {
    install -Dm755 orca-rs "$pkgdir/usr/bin/orca-rs"
    install -Dm755 orca-cli "$pkgdir/usr/bin/orca-cli"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
