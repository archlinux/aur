# Maintainer: Thomas Queiroz <thomasqueirozb @ gmail.com>
# Contributor: Sergio Schneider <spsf1964 @ gmail.com>

pkgname=mojave-gtk-theme
_pkgname=Mojave-gtk-theme
pkgver=2024_11_15
pkgrel=1
pkgdesc='A Mac OSX like theme for GTK 3, GTK 2 and Gnome-Shell which supports GTK 3 and GTK 2 based desktop environments like Gnome, Pantheon, XFCE, Mate, etc.'
arch=('any')
#depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
depends=('gtk3')
license=('GPL3')
url='https://github.com/vinceliuice/Mojave-gtk-theme'
source=("${pkgname}-${pkgver//_/-}.tar.gz::https://github.com/vinceliuice/${_pkgname}/archive/${pkgver//_/-}.tar.gz")
sha512sums=('c8ea006c0258e981f223fb7dff4036e3e042c4dfaccca578ad6db6e9ac6f3ff8728838d218acacf549085b6dd22649e18952aaf67920b3ce54deb31f17d9de52')
makedepends=('sassc' 'optipng' 'inkscape')
options=('!strip')
conflicts=('mojave-gtk-theme-git' 'mojave-gtk-theme-git-new')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
	install -m755 -d "${pkgdir}/usr/share/themes"
	./install.sh \
		 --dest "${pkgdir}/usr/share/themes" \
		 --icon arch
}

