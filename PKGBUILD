# Maintainer: Glax its@glax.dev
pkgname=eyetrackvr
pkgver=b0.3.0_8
pkgrel=2
pkgdesc="Free and Affordable, Virtual Reality Eye Tracking Platform. "
arch=('x86_64')
url="https://github.com/EyeTrackVR/EyeTrackVR"
license=('LicenseRef-Babble Software Distribution License 1.0')
depends=('eigen3' 'python')
source=("${pkgname}-${pkgver}_${pkgrel}.tar.gz::${url}/releases/download/EyeTrackApp-0.3.0-BETA-8/EyeTrackVR-0.3.0-BETA-8-linux-x86_64.tar.gz"
"EyeTrackVR.desktop")
sha256sums=("8f0f53dd01cd648bbbf65cfe3bea2ab134b4871e353d596b368efd03566af48c"
"0d7be87d7e53b71b04680c733dfe05b712a18c13a94d724b8eeeeaa1e86b8aa5")

package() {
	INSTALLDIR="${pkgdir}/opt/eyetrackvr"
	EXTRACTED="EyeTrackVR-0.3.0-BETA-8"

	# Copy files
	install -D "${srcdir}/${EXTRACTED}/eyetrackvr" "${INSTALLDIR}/eyetrackvr"
	cp -r "${srcdir}/${EXTRACTED}/_internal" "${INSTALLDIR}"

	# Add .desktop entry
	install -D "${srcdir}/EyeTrackVR.desktop" "${pkgdir}/usr/share/applications/EyeTrackVR.desktop"

	# Update .desktop entry
	# command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database || true

	# Create logs dir
	install -dm777 "${INSTALLDIR}/logs"
}
