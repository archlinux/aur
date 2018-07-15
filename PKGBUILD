# Maintainer: agentcobra <agentcobra@free.fr>
# Contributor: Nover <novares.x@gmail.com>
pkgname=shadow-beta
pkgver=0.7.6
pkgrel=2
pkgdesc="Shadow launcher"
arch=('x86_64')
url="http://shadow.tech"
license=('unknown')
groups=()
depends=('desktop-file-utils' 'freetype2' 'gcc54' 'gconf' 'hicolor-icon-theme' 'json-c' 'libappindicator-gtk2' 'libbsd' 'libcurl-gnutls' 'libdrm' 'libnotify' 'libva' 'libxtst' 'nss' 'opus' 'qt5-base' 'qt5-svg' 'sdl2' 'libappindicator' 'libcurl-compat' 'sdl' 'gcc7-libs' 'ttf-dejavu')
provides=(shadow-beta)
source=("https://macosx.update.blade-group.fr/mpl/linux/beta/bionic/shadowbeta.deb")
md5sums=('6fc188e0e818c9d3af6dbb2d51a88f91') #autofill using updpkgsums

package() {
	bsdtar xf data.tar.xz
	chmod -R g-w usr
	mv usr "${pkgdir}"
	chmod -R g-w opt
	mv opt "${pkgdir}"

# make with https://github.com/NicolasGuilloux/blade-shadow-beta
#Correct Libjson-c
sudo ln -f /usr/lib/libjson-c.so /usr/lib/libjson-c.so.3
#Correct Libubsan
sudo cp /usr/lib/gcc/x86_64-pc-linux-gnu/7.3.1/libubsan.so.0 /usr/lib/
#Fix the font issue
sudo ln -sf /usr/share/fonts/TTF /usr/share/fonts/truetype
}
