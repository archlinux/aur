# Maintainer: 1F616EMO <root at 1f616emo dot xyz>

pkgname=hdiffpatch-bin
pkgver=4.12.1
pkgrel=1
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
    '93fbde457f912e22c84a1a98c55242e9c3ba0dcef2a2ac443070d373cd328676' # hdiffpatch_v${pkgver}_bin_linux64.zip
    '220585b1cf75fbf27b3e3ca041064e34062df266af5335983fff896e9f5527e7' # LICENSE
)
package() {
    install -Dm 0755 'linux64/hdiffz' "${pkgdir}/usr/bin/hdiffz"
    install -Dm 0755 'linux64/hpatchz' "${pkgdir}/usr/bin/hpatchz"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
