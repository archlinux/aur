# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=orca-rs
pkgver=0.1.2
pkgrel=1
pkgdesc="Orca live coding environment, ported to Rust (terminal UI with MIDI/OSC/UDP output)"
arch=('x86_64' 'aarch64')
options=('!strip')
url="https://project.uhhm.no/bl/orca-rs"
license=('MIT')
depends=('alsa-lib')
optdepends=(
    'pipewire-alsa: expose the MIDI port through PipeWire'
)
provides=('orca-rs')
conflicts=('orca-rs-git' 'orca-rs-bin')
source_x86_64=("orca-rs-v${pkgver}-x86_64.tar.gz::https://project.uhhm.no/bl/orca-rs/releases/download/v${pkgver}/orca-rs-v${pkgver}-x86_64.tar.gz")
source_aarch64=("orca-rs-v${pkgver}-aarch64.tar.gz::https://project.uhhm.no/bl/orca-rs/releases/download/v${pkgver}/orca-rs-v${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('78e354ab7b0fcd6b3b358856f1a5e3d9f825f33c500f312f89ee8f9626cd5f03')
sha256sums_aarch64=('39d707f13a3bc43ccaa9ebfae36694128ebfb9701a13e1a7d8dd23f05185be28')

package() {
    install -Dm755 orca-rs "$pkgdir/usr/bin/orca-rs"
    install -Dm755 orca-cli "$pkgdir/usr/bin/orca-cli"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
