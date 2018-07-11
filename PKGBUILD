# Maintainer: agentcobra <agentcobra@free.fr>
pkgname=shadow-beta
pkgver=0.7.6
pkgrel=2
pkgdesc="Shadow launcher"
arch=('x86_64')
url="http://shadow.tech"
license=('unknown')
groups=()
depends=('desktop-file-utils' 'freetype2' 'gcc54' 'gconf' 'hicolor-icon-theme' 'json-c' 'libappindicator-gtk2' 'libbsd' 'libcurl-gnutls' 'libdrm' 'libnotify' 'libva' 'libxtst' 'nss' 'opus' 'qt5-base' 'qt5-svg' 'sdl2')
provides=(shadow-beta)
source=("https://macosx.update.blade-group.fr/mpl/linux/beta/bionic/shadowbeta.deb")
md5sums=('6fc188e0e818c9d3af6dbb2d51a88f91') #autofill using updpkgsums

package() {
	bsdtar xf data.tar.xz
	chmod -R g-w usr
	mv usr "${pkgdir}"
	chmod -R g-w opt
	mv opt "${pkgdir}"
        install -Dm644 "shadow-beta.desktop" "${pkgdir}/usr/share/applications/shadow-beta.desktop"
}
