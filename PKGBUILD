# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>
pkgname=gnome-shell-extension-shuzhi
_pkgname=shuzhi
pkgver=3.38
pkgrel=1
pkgdesc="A wallpaper generation extension for gnome shell, inspired by Jizhi."
arch=('any')
url="https://github.com/tuberry/shuzhi"
license=('GPL3')
depends=('gnome-shell')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('bc2680639b35fdd3157d7d827a9a0d184a0b2238000f303e37d000f9068d9407a7375ed13c622eb5312ceb76469d360983ab3cffa2de9178929f1ee351f91a22')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
