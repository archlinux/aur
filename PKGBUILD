# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_projname='NExtGen'
pkgname="${_projname,,}"
pkgver='0.1.3'
pkgrel=1
pkgdesc="A small bash script that lets you easily set up a new extension project for GNOME's Nautilus file manager"
arch=('any')
url="https://github.com/madmurphy/${_projname}"
license=('GPL')
depends=('bash' 'libnautilus-extension')
conflicts=("${pkgname}-git")
source=("https://github.com/madmurphy/${_projname}/archive/${pkgver}.tar.gz")
sha256sums=('637f3902b46871a52d35527c75f299c19fcd2a9e90b745e89434604d0e56fedb')

prepare() {

	cd "${srcdir}/${_projname}-${pkgver}"
	autoreconf -i

}

build() {

	cd "${srcdir}/${_projname}-${pkgver}"
	./configure --prefix=/usr

}

package() {

	cd "${srcdir}/${_projname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

}

