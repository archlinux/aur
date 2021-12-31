# Maintainer: Mario Rubio <mario at mrrb dot eu>
# Contributor: Amr Okasha <amradel55 at gmail dot com>
# Contributor: Knight <anonymousknight96 at gmail dot com>
pkgname=digilent.adept.utilities
pkgver=2.7.1
pkgrel=1
pkgdesc="Digilent Adept Utilities."
arch=('i686' 'x86_64' 'aarch64')
url="https://digilent.com/reference/software/adept/start"
license=('custom')
depends=('digilent.adept.runtime>=2.21.2')
options=('!strip' '!emptydirs')

source_i686=("https://digilent.s3.amazonaws.com/Software/AdeptUtilities/${pkgver}/${pkgname}_${pkgver}-i386.deb")
source_x86_64=("https://digilent.s3.amazonaws.com/Software/AdeptUtilities/${pkgver}/${pkgname}_${pkgver}-amd64.deb")
source_aarch64=("https://digilent.s3.amazonaws.com/Software/AdeptUtilities/${pkgver}/${pkgname}_${pkgver}-arm64.deb")
sha256sums_i686=('954ef56e3e702dde125a404336ecc886e02b3b8fe0adea30608b14745feef4e9')
sha256sums_x86_64=('efbfc97b69fa6d6dc465991492dceb308ef9ea220e185bcfd12f0b7494465842')
sha256sums_aarch64=('f8dc86b30c456a83ed0e588a9f719a3a3d1b4bf7a27e8ef729c00387b875e261')

package(){
	# Extract package data
	tar -xJf data.tar.xz -C "${pkgdir}"/

	install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
	ln -s "/usr/share/doc/${pkgname}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}
