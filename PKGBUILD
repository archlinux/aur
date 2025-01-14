# Maintainer: Alessandro Bernardello
pkgname=ente-auth-bin
pkgver=4.2.7
pkgrel=1
pkgdesc="Ente two-factor authenticator."
arch=('x86_64')
url="https://github.com/ente-io/ente/releases/tag/auth-v${pkgver}"
license=('AGPL-3.0')
depends=('at-spi2-core' 'ayatana-ido' 'cairo' 'desktop-file-utils' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'harfbuzz' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libayatana-appindicator' 'libsecret' 'libsodium-1.0.18' 'pango' 'sqlite' 'webkit2gtk' 'xdg-user-dirs')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://github.com/ente-io/ente/releases/download/auth-v${pkgver}/ente-auth-v${pkgver}-x86_64.deb")
sha256sums_x86_64=('6b12d29c93388a08096906f58c80ef01ebeff439d07976d96b1eaf9a50d4170b')
provides=("ente-auth")
conflicts=("ente-auth")

package(){
	tar -xJ -f data.tar.xz -C "${pkgdir}"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s /usr/share/enteauth/enteauth "${pkgdir}/usr/bin/enteauth"
}