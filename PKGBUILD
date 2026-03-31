# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=pacmate-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Interactive terminal UI wrapper for pacman"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://gitlab.com/nathanchere/pacmate"
license=('Apache-2.0')
depends=('pacman')
optdepends=('sudo: default privilege escalation helper')
provides=('pacmate')
conflicts=('pacmate')

_base_url="https://gitlab.com/api/v4/projects/76014792/packages/generic/pacmate/v${pkgver}"

source_x86_64=("${_base_url}/pacmate_v${pkgver//./_}_amd64.tar.gz")
source_i686=("${_base_url}/pacmate_v${pkgver//./_}_386.tar.gz")
source_aarch64=("${_base_url}/pacmate_v${pkgver//./_}_arm64.tar.gz")
source_armv7h=("${_base_url}/pacmate_v${pkgver//./_}_arm.tar.gz")

sha256sums_x86_64=('5628e4143a653d0454aa4f2e51d79e1f964e2a6b6621b38e534df9b5e6db4b23')
sha256sums_i686=('c95a50d6b1d993513eda2c53d6c2524ecb8566714a3953b0178eeebf06c0d40e')
sha256sums_aarch64=('5ddeab63863af56f6571354f0ccc6b768d5e2e3720b18f60b88ec51fa5896db5')
sha256sums_armv7h=('3e018d523703f56e5fdc955e4884640f6d9943d3277e656199443774b758352c')

package() {
    install -Dm755 "pacmate" "${pkgdir}/usr/bin/pacmate"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
