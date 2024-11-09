# Maintainer: Felipe Martin <me@fmartingr.com>
# Maintainer: Matt Warner <mattwarner001@gmail.com>
# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>

pkgname="synology-drive"
pkgver="3.5.1_16102"
_pkgver="3.5.1-16102"
_subver="16102"
pkgrel="1"
pkgdesc="Desktop utility of the DSM add-on package, Synology Drive Server"
arch=('x86_64')
url="https://www.synology.com/en-global/releaseNote/SynologyDriveClient"
license=('custom:Synology Linux License Grant')
depends=('glibc' )
optdepends=('nautilus: For nautilus integration' )
source_x86_64=("https://global.synologydownload.com/download/Utility/SynologyDriveClient/${_pkgver}/Ubuntu/Installer/synology-drive-client-${_subver}.x86_64.deb")
sha256sums_x86_64=('6f13838d7384f757a3f08db60d640a6d6ef5a088d11d0c7d232bce6a6de3fe2c')

package() {
	cd "${srcdir}"
	tar -xJf data.tar.xz -C "${pkgdir}"
	ls "${pkgdir}"
	install -Dm 644 "${pkgdir}"/opt/Synology/SynologyDrive/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
