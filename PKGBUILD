# Maintainer: VHSgunzo <vhsgunzo.github.io>
pkgname='importenv-bin'
binname="${pkgname%-bin}"
pkgver='0.0.7'
pkgrel='1'
pkgdesc='Launching an executable file with environment variables from a specific process id'
arch=("aarch64" "x86_64")
url="https://github.com/VHSgunzo/${binname}"
provides=("${pkgname}" "${binname}")
conflicts=("${pkgname}" "${binname}" "${binname}-git")
source=(
    "${binname}-${CARCH}::${url}/releases/download/v${pkgver}/${binname}-${CARCH}"
    "LICENSE::https://raw.githubusercontent.com/VHSgunzo/${binname}/refs/heads/main/LICENSE"
)
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 "${binname}-${CARCH}" "$pkgdir/usr/bin/${binname}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${binname}/LICENSE"
}
