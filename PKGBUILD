# Maintainer: Thomas Queiroz <thomasqueirozb @ gmail.com>
# Contributor: Sergio Schneider <spsf1964 @ gmail.com>

pkgname=mojave-gtk-theme
_pkgname=Mojave-gtk-theme
pkgver=2023_08_04
pkgrel=1
pkgdesc='A Mac OSX like theme for GTK 3, GTK 2 and Gnome-Shell which supports GTK 3 and GTK 2 based desktop environments like Gnome, Pantheon, XFCE, Mate, etc.'
arch=('any')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
license=('GPL3')
url='https://github.com/vinceliuice/Mojave-gtk-theme'
source=("${pkgname}-${pkgver//_/-}.tar.gz::https://github.com/vinceliuice/${_pkgname}/archive/${pkgver//_/-}.tar.gz")
sha512sums=('e5a9730262dd02c5ad1aebce82a1258768699c3d592e1692cef81d89878660b0d6a81101a2d1c1f31c3fe2cba8603f9fb110eba2e8d8290e5bf4b34138ed2dd4')
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

