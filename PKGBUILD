# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nextgen'
pkgver='0.2.0'
pkgrel=1
pkgdesc="An interactive Bash script that lets you easily set up a new extension project for GNOME Files (formerly Nautilus)"
arch=('any')
url="https://gitlab.gnome.org/madmurphy/${pkgname}"
license=('GPL')
depends=('bash' 'libnautilus-extension')
conflicts=("${pkgname}-git")
source=("https://gitlab.gnome.org/madmurphy/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fd2ef0eb644a2f51958c3f4ebcea7f326553e0a6a7fe251844c11439c9aee913')

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

