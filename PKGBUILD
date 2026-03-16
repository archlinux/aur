# Maintainer: Sam Zuk <sam11120a@gmail.com>
pkgname=vmpc2000xl-vst3-bin
pkgver=0.9.3
pkgrel=1
pkgdesc='MPC2000XL sampler emulator (VST3)'
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
)
source=(
    "https://github.com/izzyreal/vmpc-juce/releases/download/v${pkgver}/VMPC2000XL-Ubuntu20-x86_64-VST3.zip"
    "https://github.com/izzyreal/vmpc-juce/raw/refs/tags/v${pkgver}/README.md"
    "https://github.com/izzyreal/vmpc-juce/raw/refs/tags/v${pkgver}/LICENSE.txt"
)
sha256sums=(
    '74c65b8d78b394a46933997cc07af3c6492110c48b387ddac9584ea70e180a90'
    '8195bf5f0fa05983867b74afa8e0585fc6cff16f1ea0c840d42e700eef5e057a'
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

package() {
    install -Dm755 './VMPC2000XL.vst3/Contents/x86_64-linux/VMPC2000XL.so' \
        "${pkgdir}/usr/lib/vst3/VMPC2000XL.vst3/Contents/x86_64-linux/VMPC2000XL.so"
    install -Dm755 './VMPC2000XL.vst3/Contents/Resources/moduleinfo.json' \
        "${pkgdir}/usr/lib/vst3/VMPC2000XL.vst3/Contents/Resources/moduleinfo.json"
    mkdir -pm755 "${pkgdir}/usr/share/doc/vmpc2000xl-vst3"
    install -m644 './README.md' "${pkgdir}/usr/share/doc/vmpc2000xl-vst3"
    mkdir -pm755 "${pkgdir}/usr/share/licenses/vmpc2000xl-vst3"
    install -m644 './LICENSE.txt' "${pkgdir}/usr/share/licenses/vmpc2000xl-vst3/LICENSE"
}
