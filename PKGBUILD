# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=udev-block-notify
pkgver=0.7.8
pkgrel=1
pkgdesc='Notify about udev block events'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/udev-block-notify'
depends=('libnotify' 'udev' 'gnome-icon-theme' 'gnome-icon-theme-extras')
makedepends=('markdown')
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("http://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('896bf0e961bce190ac36dc0c31e6abcb36d962c2ae19260efcd5fbf50225ff29'
            'SKIP')

build() {
	cd ${pkgname}-${pkgver}/

	make
}

package() {
	cd ${pkgname}-${pkgver}/

	make DESTDIR="${pkgdir}" install
}

