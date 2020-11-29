# Maintainer: Thomas Queiroz <thomasqueirozb@gmail.com>
# Contributor: Sergio Schneider <spsf1964@gmail.com>

pkgname=mojave-gtk-theme
_pkgname=Mojave-gtk-theme
pkgver=2020_11_29
pkgrel=1
pkgdesc='A Mac OSX like theme for GTK 3, GTK 2 and Gnome-Shell which supports GTK 3 and GTK 2 based desktop environments like Gnome, Pantheon, XFCE, Mate, etc.'
arch=('any')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
license=('GPL3')
url='https://github.com/vinceliuice/Mojave-gtk-theme'
source=("${pkgname}-${pkgver//_/-}.tar.gz::https://github.com/vinceliuice/${_pkgname}/archive/${pkgver//_/-}.tar.gz")
sha512sums=('fe136ba23c305ce5b3d3e6b528aa527dedfa6c6334c2390cdb2459071fcf859a16d02343ffaeb5aa09221eb7b5754e4d5cbd2de962c781423e8fca5b684020e6')
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

