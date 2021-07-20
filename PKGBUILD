# Maintainer: Thomas Queiroz <thomasqueirozb @ gmail.com>
# Contributor: Sergio Schneider <spsf1964 @ gmail.com>

pkgname=mojave-gtk-theme
_pkgname=Mojave-gtk-theme
pkgver=2021_07_20
pkgrel=1
pkgdesc='A Mac OSX like theme for GTK 3, GTK 2 and Gnome-Shell which supports GTK 3 and GTK 2 based desktop environments like Gnome, Pantheon, XFCE, Mate, etc.'
arch=('any')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
license=('GPL3')
url='https://github.com/vinceliuice/Mojave-gtk-theme'
source=("${pkgname}-${pkgver//_/-}.tar.gz::https://github.com/vinceliuice/${_pkgname}/archive/${pkgver//_/-}.tar.gz")
sha512sums=('be85934cfb123e2c5a015cb60b5665946b83d1f368e5c04cb41ef77b7141e500200f30b8e5bca76a2af9fceb5a9ac541d805c549d9b412f77bfe296ca0994869')
makedepends=('sassc' 'optipng' 'inkscape')
options=('!strip')
conflicts=('mojave-gtk-theme-git')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
	install -m755 -d "${pkgdir}/usr/share/themes"
	./install.sh \
		 --dest "${pkgdir}/usr/share/themes" \
		 --icon arch
}

