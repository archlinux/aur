# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>
pkgname=gnome-shell-extension-shuzhi
_pkgname=shuzhi
pkgver=40
pkgrel=3
pkgdesc="A wallpaper generation extension for gnome shell, inspired by Jizhi."
arch=('any')
url="https://github.com/tuberry/shuzhi"
license=('GPL3')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('bbce1b9643060e7e045fea6a9d406fa4bf51bbb51c926b93c12a0e6928ca1fc12ab054035bd59f7113a80bf8c685c948ca4369b6aae9a73aa5ec79a00b8a7f49')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
