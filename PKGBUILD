# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=orca-rs
pkgver=0.1.0
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
sha256sums_x86_64=('b340783f196cf030d968e25765f41d982356960d1bae8b9c757391eb3e506065')
sha256sums_aarch64=('cc8ac657c448744c52a365cdfa1473e5ae542a9cbeac3904ea6a1f0cdacdf282')

package() {
    install -Dm755 orca-rs "$pkgdir/usr/bin/orca-rs"
    install -Dm755 orca-cli "$pkgdir/usr/bin/orca-cli"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
