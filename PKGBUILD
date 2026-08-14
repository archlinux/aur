# Maintainer: Matt Warner <mattwarner001@gmail.com>
# Contributor: Helmut Stult <hst[at]e-mail[dot]de>
# Contributor: Felipe Martin <me@fmartingr.com>

pkgname=synology-drive
pkgver=4.2.0_20058
_pkgver=4.2.0
_pkgrel=20058
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
sha256sums_x86_64=('430031fdf5a12e655ce5cfc6b964d9b5cbdddebccdbf3fa6b5660546cb91f99d')

package() {
	cd "${srcdir}"
	tar -xJf data.tar.xz -C "${pkgdir}"
	install -Dm 644 "${pkgdir}"/opt/Synology/SynologyDrive/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
