# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>
# Contributor: Felipe Martin <me@fmartingr.com>
# Contributor: Matt Warner <mattwarner001@gmail.com>

pkgname=synology-drive
pkgver=4.0.2_17889
_pkgver=4.0.2
_pkgrel=17889
pkgrel=1
pkgdesc="Desktop utility of the DSM add-on package, Synology Drive Server"
arch=('x86_64')
url="https://www.synology.com/en-global/releaseNote/SynologyDriveClient"
license=('custom:Synology Linux License Grant')
depends=('glib2' 'glibc' 'qt5-base' 'qt5-wayland' 'curl' 'libarchive' 'libxkbcommon' 'libice' 'libsm' 'hicolor-icon-theme')
makedepends=('qt5-tools')
optdepends=('nautilus: For nautilus integration')
conflicts=('synology-drive' 'synology-drive-client' 'cloudstation-beta' 'cloudstation-3.0' 'cloudstation-drive')
source_x86_64=("https://global.synologydownload.com/download/Utility/SynologyDriveClient/${_pkgver}-${_pkgrel}/Ubuntu/Installer/synology-drive-client-${_pkgrel}.${arch}.deb")
sha256sums_x86_64=('ade7ec033a9898a02bd74ec3e0788956205013541ae90a0e102b57f933e34b05')

package() {
	cd "${srcdir}"
	tar -xJf data.tar.xz -C "${pkgdir}"
	install -Dm 644 "${pkgdir}"/opt/Synology/SynologyDrive/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
