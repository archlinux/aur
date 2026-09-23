# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=paper-age-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Easy and secure paper backups of secrets via encrypted QR code (Pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/matiaskorhonen/paper-age"
license=('MIT')
provides=('paper-age')
conflicts=('paper-age')
depends=()
_source_template="https://github.com/matiaskorhonen/paper-age/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::$_source_template/paper-age-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::$_source_template/paper-age-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('89722cb8fb4a13b5b63741c6818aef114ae478e6bf368ad6dc0e9ba50736216c')
sha256sums_aarch64=('4e9d10392aba53944abc17d6747db18cd868282199b498be4514f52fa47b590c')

package() {

	install -Dm755 "${srcdir}/paper-age" "${pkgdir}/usr/bin/paper-age"

	if [ -f "${srcdir}/LICENSE" ]; then
		install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	fi
}
