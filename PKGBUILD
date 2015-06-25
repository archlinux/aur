# Maintainer: GreenRaccoon23 <GreenRaccoon a t gmail d o t com>

pkgname=archdroid-icon-theme
pkgver=r79.4ea3b0a
pkgrel=1
pkgdesc="Port of Android 5.0 Lollipop's material design icons to Arch."
arch=('any')
url="https://github.com/GreenRaccoon23/${pkgname}"
license=('GPL3')
makedepends=('intltool' 'librsvg' 'gtk-update-icon-cache')
provides=("${pkgname}")
conflicts=("${pkgname}")
#options=('!strip')
install="${pkgname}.install"
source=("https://github.com/GreenRaccoon23/${pkgname}/raw/master/${pkgname}.tar.xz")
md5sums=("9a5cddd7b567c484e6e8f9c8f40ee5e5")

_error2() {
	for e; do
		echo "    ${e}";
	done;
}

prepare() {
	if ! fc-list | grep Roboto >/dev/null; then
		error "Required font 'Roboto' is not installed."
		error "Please install a font package which includes 'Roboto', such as:"
		_error2 ttf-roboto ttf-roboto-font ttf-google-fonts-git ttf-google-fonts-hg otf-google-fonts-hg;
		return 1;
	fi;
}

package() {
	msg2 "Installing ${pkgname}..." ;
	cd ${pkgname} ;
  	install -dm 755 "${pkgdir}"/usr/share/icons
  	cp -drf --no-preserve='ownership' . "${pkgdir}"/usr/share/icons/
}

