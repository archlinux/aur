# Maintainer: Thomas Queiroz <thomasqueirozb@gmail.com>
# Contributor: Sergio Schneider <spsf1964@gmail.com>

pkgname=mojave-gtk-theme
_pkgname=Mojave-gtk-theme
pkgver=2020_03_24
pkgrel=1
pkgdesc='A Mac OSX like theme for GTK 3, GTK 2 and Gnome-Shell which supports GTK 3 and GTK 2 based desktop environments like Gnome, Pantheon, XFCE, Mate, etc.'
arch=('any')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
license=('GPL3')
url='https://github.com/vinceliuice/Mojave-gtk-theme'
source=("${pkgname}-${pkgver//_/-}.tar.gz::https://github.com/vinceliuice/${_pkgname}/archive/${pkgver//_/-}.tar.gz")
sha512sums=('352b883f8fdf59a3f148bc0a51884afbcb88d78cccfa5f26915aed74afebd6e42b573f61313e275b79c6b1cc9da23f2c1ce7dcb978c21878ae440b1b957d6261')
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

