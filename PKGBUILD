# Maintainer: madmurphy <madmurphy333 AT gmail DOT com>

pkgname='nextgen'
pkgver='0.3.3'
pkgrel=1
pkgdesc='An interactive Bash script that lets you easily set up a new extension project for GNOME Files (Nautilus)'
arch=('any')
url="https://gitlab.gnome.org/madmurphy/${pkgname}"
license=('GPL')
depends=('bash' 'libnautilus-extension')
conflicts=("${pkgname}-git")
source=("https://gitlab.gnome.org/madmurphy/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bbf511cc828c1b9659171a055219abe903bbd757190872aaa70d95be6e736df2')

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

