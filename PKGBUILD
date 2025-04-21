# Maintainer: Martin Filion <mordillo98 AT gmail DOT com>
# Maintainer: Eivind Eide <xenofil AT gmail DOT com>
# Contributor: Christian Hesse <arch AT eworm DOT de>
# Contributor: BlackICE <manfredi AT gmail DOT com>
# Contributor: jsteel <jsteel AT aur DOT archlinux DOT org>
# Contributor: Arkham <arkham AT archlinux DOT us>
# Contributor: Artyom Smirnov <smirnoffjr AT gmail DOT com>
# Contributor: Marius <marius AT matamare DOT ro>

pkgname=gnome-colors-icon-theme
pkgname_link=gnome-colors-icon-theme
pkgver=5.5.6
pkgrel=1
pkgdesc='GNOME-Colors icon theme'
arch=('any')
url='https://github.com/themix-project/gnome-colors-icon-theme'
license=('GPL2')
conflicts=('gnome-colors-icon-theme-extras')
replaces=('gnome-colors-icon-theme-extras')
makedepends=('git' 'librsvg' 'imagemagick' 'python-numpy')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('0c7d90e84146fdccea3b895926345121ebd5ebba659b21770ea88c506766e6ce')

build() {
	cd "${pkgname}-${pkgver}/gnome-colors/"

	make
}

package() {
	cd "${pkgname}-${pkgver}/gnome-colors/"

	make DESTDIR="${pkgdir}/" install
}


