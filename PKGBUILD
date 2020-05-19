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
sha256sums=('e18e1685cd5f028b69fcecb27beff47ab0513f3f8e0e54b0b97b2836c3b1cb5d')

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

