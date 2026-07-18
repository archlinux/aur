# Maintainer: Glax its@glax.dev
pkgname=mica-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Use your Android phone as a microphone"
arch=('x86_64')
url="https://github.com/acaimingus/Mica"
license=('MIT')
source=("${pkgname}-${pkgver}_${pkgrel}::${url}/releases/download/${pkgver}/MicaListener-${pkgver}-amd64"
"MicaListener.desktop")
sha256sums=("53283c0e774af27681a88e23533226a2bed20d4932d31f06a8abdf01548c7c1a"
"88a437c77ac85273c3a44ef5940dfe1c77c5cedddf86d45a567ab65a63ce9cd8")
noextract=("${pkgname}-${pkgver}_${pkgrel}")
provides=("mica" "micalistener")

package() {
	# Copy files
	install -D "${srcdir}/${pkgname}-${pkgver}_${pkgrel}" "${pkgdir}/opt/micalistener/micalistener"

	# Add .desktop entry
	install -D "${srcdir}/MicaListener.desktop" "${pkgdir}/usr/share/applications/MicaListener.desktop"

	# Update .desktop entry
	# command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database || true
}
