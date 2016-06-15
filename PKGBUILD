# Maintainer: theferdi265 at gmail dot com

pkgname=gtk-theme-numix-solarized-git
pkgver=1.20160614.r5.gb6fce07
pkgrel=1
pkgdesc="Solarized versions of Numix GTK2 and GTK3 theme, compatible with GTK 3.20"
arch=('any')
url="https://github.com/Ferdi265/numix-solarized-gtk-theme"
license=('GPL3')
conflicts=('gtk-theme-numix-solarized')
depends=('gtk-engine-murrine')
makedepends=('git' 'make' 'ruby-sass' 'glib2')
source=('git+https://github.com/Ferdi265/numix-solarized-gtk-theme.git')
md5sums=('SKIP')

pkgver() {
	cd "numix-solarized-gtk-theme"
	git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd "numix-solarized-gtk-theme"
	make DESTDIR="${pkgdir}" install
}
