# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>
# Contributor: Felipe Martin <me@fmartingr.com>
# Contributor: Matt Warner <mattwarner001@gmail.com>

pkgname=synology-drive
pkgver=3.5.2_16110
_pkgver=3.5.2
_pkgrel=16110
pkgrel=5
pkgdesc="Desktop utility of the DSM add-on package, Synology Drive Server"
arch=('x86_64')
url="https://www.synology.com/en-global/releaseNote/SynologyDriveClient"
license=('custom:Synology Linux License Grant')
depends=('glib2' 'glibc' 'qt5-base' 'curl' 'libarchive' 'libxkbcommon' 'libice' 'libsm' 'hicolor-icon-theme')
makedepends=('qt5-tools')
optdepends=('nautilus: For nautilus integration')
conflicts=('synology-drive' 'synology-drive-client' 'cloudstation-beta' 'cloudstation-3.0' 'cloudstation-drive')
source_x86_64=("https://global.synologydownload.com/download/Utility/SynologyDriveClient/${_pkgver}-${_pkgrel}/Ubuntu/Installer/synology-drive-client-${_pkgrel}.${arch}.deb")
sha256sums_x86_64=('a464b931951d0504d6e7c6b674de7563c075f26cdc3198ffc8560254fc0fee61')

package() {
	cd "${srcdir}"
	tar -xJf data.tar.xz -C "${pkgdir}"
	install -Dm 644 "${pkgdir}"/opt/Synology/SynologyDrive/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
