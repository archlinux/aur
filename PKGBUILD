# Maintainer: 1F616EMO <root at 1f616emo dot xyz>

pkgname=hdiffpatch-bin
pkgver=4.8.0
pkgrel=2
pkgdesc='a C\C++ library and command-line tools for Diff & Patch between binary files or directories(folder)'
arch=('x86_64') # TODO: x86 arm32 arm64 loong64 riscv32 riscv64
url='https://github.com/sisong/HDiffPatch/'
license=('MIT')
provides=('hdiffpatch')
source=(
    "https://github.com/sisong/HDiffPatch/releases/download/v${pkgver}/hdiffpatch_v${pkgver}_bin_linux64.zip"
    "https://raw.githubusercontent.com/sisong/HDiffPatch/v${pkgver}/LICENSE"
)
sha256sums=(
    '2a5c9f487537582d21d8124ecdea0926bc6d2f6e74d48b963eb819172b5521b4' # hdiffpatch_v${pkgver}_bin_linux64.zip
    '18dee5fae8398d7d863359a332d0b1bc08fc0405c094ac1233926a9053f883f3' # LICENSE
)
package() {
    install -Dm 0755 'linux64/hdiffz' "${pkgdir}/usr/bin/hdiffz"
    install -Dm 0755 'linux64/hpatchz' "${pkgdir}/usr/bin/hpatchz"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
