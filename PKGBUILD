# Maintainer: Sam Zuk <sam11120a@gmail.com>
pkgname=vmpc2000xl-lv2-bin
pkgver=0.9.13
pkgrel=1
pkgdesc='MPC2000XL sampler emulator (LV2)'
arch=('x86_64')
url='https://www.izmar.nl/'
license=('GPL-3.0-or-later')
depends=(
    'libx11'
    'jack'
    'alsa-lib>=1.0.16'
    'glibc>=2.35'
    'libgcc>=3.4'
    'glib2>=2.30.0'
    'libstdc++>=12'
    'udisks2>=2.0.0'
    'libxcb'  # unknown version requirement
    'zlib'  # unknown version requirement
    'util-linux-libs'  # unknown version requirement
    'libffi'  # unknown version requirement
    'pcre2'  # unknown version requirement
    'libpipewire'  # unknown version requirement
    'libxau'  # unknown version requirement
    'libxdmcp'  # unknown version requirement
    'systemd-libs'  # unknown version requirement
)
source=(
    "https://github.com/izzyreal/vmpc-juce/releases/download/v${pkgver}/VMPC2000XL-Ubuntu20-x86_64-LV2.zip"
    "https://github.com/izzyreal/vmpc-juce/raw/refs/tags/v${pkgver}/README.md"
    "https://github.com/izzyreal/vmpc-juce/raw/refs/tags/v${pkgver}/LICENSE.txt"
)
sha256sums=(
    '4122752b3fdf4645fec81586e29bd01176ebf4368e5feae1fcb7176837de4506'
    '8195bf5f0fa05983867b74afa8e0585fc6cff16f1ea0c840d42e700eef5e057a'
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

package() {
    for x in "libVMPC2000XL.so" "dsp.ttl" "manifest.ttl" "ui.ttl"; do
        install -Dm755 "./VMPC2000XL.lv2/$x" -t "${pkgdir}/usr/lib/lv2/VMPC2000XL.lv2"
    done
    mkdir -pm755 "${pkgdir}/usr/share/doc/vmpc2000xl-lv2"
    install -m644 './README.md' "${pkgdir}/usr/share/doc/vmpc2000xl-lv2"
    mkdir -pm755 "${pkgdir}/usr/share/licenses/vmpc2000xl-lv2"
    install -m644 './LICENSE.txt' "${pkgdir}/usr/share/licenses/vmpc2000xl-lv2/LICENSE"
}
