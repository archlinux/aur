# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nextgen'
pkgver='0.3.2'
pkgrel=1
pkgdesc='An interactive Bash script that lets you easily set up a new extension project for GNOME Files (Nautilus)'
arch=('any')
url="https://gitlab.gnome.org/madmurphy/${pkgname}"
license=('GPL')
depends=('bash' 'libnautilus-extension')
conflicts=("${pkgname}-git")
source=("https://gitlab.gnome.org/madmurphy/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b97a7a972e675a89c3f45af10d9668b8e8613102eacb1e28f1749b78e55a974c')

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

