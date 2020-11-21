# Maintainer: Michael Riegert <michael at eowyn net>

pkgname=fpga-toolchain-bin
pkgver=20201121
pkgrel=1
pkgdesc="Nightly builds of open-source FPGA tools"
arch=('x86_64')
url="https://github.com/open-tool-forge/fpga-toolchain"
license=('GPL3')
depends=('python' 'bash' 'rsync')
conflicts=(
    'yosys'
    'ghdl-yosys-plugin'
    'ghdl'
    'trellis'
    'icestorm'
    'nextpnr'
    'dfu-util'
    'ecpprog'
    'openfpgaloader'
    'boolector'
    'symbiyosys'
    'z3'
    'yices'
    'prjtrellis'
    'prjtrellis-db'
    )
source_x86_64=($url/releases/download/nightly-$pkgver/fpga-toolchain-linux_x86_64-nightly-$pkgver.tar.xz)
sha256sums_x86_64=('19b87d120c8fd242749bb78635e5010132a7c49200d5c5ef8a379072346fa339')
package() {
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/include" "$pkgdir/usr/lib/ghdl" "$pkgdir/usr/share"
    rsync -a "$srcdir/fpga-toolchain/" "$pkgdir/usr/" --chmod=755 --exclude lib/python3.8 --exclude VERSION --exclude lib/libghdl.link
    chmod 644 "$pkgdir/usr/lib/libghdl.a"
}
