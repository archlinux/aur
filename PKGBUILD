# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=orca-rs
pkgver=0.2.0
pkgrel=1
pkgdesc="Orca live coding environment, ported to Rust (terminal UI with MIDI/OSC/UDP output and Ableton Link sync)"
arch=('x86_64' 'aarch64')
options=('!strip')
url="https://project.uhhm.no/bl/orca-rs"
# Source is MIT; the binaries link Ableton Link, which is GPL-2.0-or-later.
license=('MIT' 'GPL-2.0-or-later')
depends=('alsa-lib' 'gcc-libs')
optdepends=(
    'pipewire-alsa: expose the MIDI port through PipeWire'
)
provides=('orca-rs')
conflicts=('orca-rs-git' 'orca-rs-bin')
source_x86_64=("orca-rs-v${pkgver}-x86_64.tar.gz::https://project.uhhm.no/bl/orca-rs/releases/download/v${pkgver}/orca-rs-v${pkgver}-x86_64.tar.gz")
source_aarch64=("orca-rs-v${pkgver}-aarch64.tar.gz::https://project.uhhm.no/bl/orca-rs/releases/download/v${pkgver}/orca-rs-v${pkgver}-aarch64.tar.gz")
sha256sums_x86_64=('58a63e4552e616cdea6468780a4d6a3850cad620800bd6418b2d6950eb33b923')
sha256sums_aarch64=('0a2cdf4441e787cfaa4135b00104a3ddd904bafb9d6525a34558faf44a8eee92')

package() {
    install -Dm755 orca-rs "$pkgdir/usr/bin/orca-rs"
    install -Dm755 orca-cli "$pkgdir/usr/bin/orca-cli"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
