# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='ulexec-bin'
binname="${pkgname%-bin}"
pkgver='0.1.3'
pkgrel='1'
pkgdesc='A tool for loading and executing PE on Windows and ELF on Linux from memory'
arch=("aarch64" "x86_64")
url="https://github.com/VHSgunzo/${binname}"
provides=("${pkgname}" "${binname}")
conflicts=("${pkgname}" "${binname}" "${binname}-git")
source=(
    "${binname}::${url}/releases/download/v${pkgver}/${binname}-${CARCH}"
    "LICENSE::https://raw.githubusercontent.com/VHSgunzo/${binname}/refs/heads/main/LICENSE"
)
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 ${binname} "$pkgdir/usr/bin/${binname}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${binname}/LICENSE"
}
