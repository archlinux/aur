# Maintainer: Michael Riegert <michael at eowyn net>

pkgname=fpga-toolchain-bin
pkgver=20200911
pkgrel=1
pkgdesc="Nightly builds of open-source FPGA tools"
arch=('x86_64')
url="https://github.com/open-tool-forge/fpga-toolchain"
license=('GPL3')
depends=('python' 'bash')
conflicts=(
    'yosys'
    'ghdl-yosys-plugin'
    'ghdl'
    'trellis'
    'icestorm'
    'nextpnr'
    'dfu-util' 'dfu-util-git'
    'ecpprog'
    'openfpgaloader'
    )
source_x86_64=($url/releases/download/nightly-$pkgver/fpga-toolchain-linux_x86_64-nightly-$pkgver.tar.xz)
sha256sums_x86_64=('d29b8cde356cafe34cd106f7377e59b868ada9fbd4c61ec794b6d4f0a7d39b68')
package() {
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/include" "$pkgdir/usr/lib/ghdl" "$pkgdir/usr/share"
    rsync -a "$srcdir/fpga-toolchain/" "$pkgdir/usr/" --chmod=755 --exclude lib/python3.8 --exclude VERSION --exclude lib/libghdl.link
    chmod 644 "$pkgdir/usr/lib/libghdl.a"
}
