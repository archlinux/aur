# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nextgen'
pkgver='0.1.8'
pkgrel=1
pkgdesc="A small bash script that lets you easily set up a new extension project for GNOME's Nautilus file manager"
arch=('any')
url="https://gitlab.gnome.org/madmurphy/${pkgname}"
license=('GPL')
depends=('bash' 'libnautilus-extension')
conflicts=("${pkgname}-git")
source=("https://gitlab.gnome.org/madmurphy/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6adb1ab6e05b202103353f7ba6c88bba6a83f437fc44c51370149df18668068c')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	autoreconf -i

}

build() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

}

