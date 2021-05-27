# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nextgen'
pkgver='0.3.0'
pkgrel=1
pkgdesc='An interactive Bash script that lets you easily set up a new extension project for GNOME Files (formerly Nautilus)'
arch=('any')
url="https://gitlab.gnome.org/madmurphy/${pkgname}"
license=('GPL')
depends=('bash' 'libnautilus-extension')
conflicts=("${pkgname}-git")
source=("https://gitlab.gnome.org/madmurphy/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c6bd0f7a6f295169489258c97eca8aa0cb05a77f113d401c9d1aced940a9a86d')

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

