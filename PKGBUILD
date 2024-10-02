# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='ulexec-bin'
binname="${pkgname%-bin}"
pkgver='0.0.2'
pkgrel='1'
pkgdesc='A tool for loading and executing PE on Windows and ELF on Linux from memory'
arch=("x86_64")
url='https://github.com/VHSgunzo/ulexec'
provides=("${pkgname}" "${binname}")
conflicts=("${pkgname}" "${binname}" "${binname}-git")
source=(
    "${binname}::https://github.com/VHSgunzo/${binname}/releases/download/v${pkgver}/${binname}"
    "LICENSE::https://raw.githubusercontent.com/VHSgunzo/${binname}/refs/heads/main/LICENSE"
)
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 ${binname} "$pkgdir/usr/bin/${binname}"
    install -Dm755 LICENSE "$pkgdir/usr/share/licenses/ulexec/LICENSE"
}
