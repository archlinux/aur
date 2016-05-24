# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=gimp-lensfun
pkgver=0.2.4
pkgrel=1
pkgdesc="A Gimp plugin to correct lens distortion using the lensfun library and database."
arch=('i686' 'x86_64')
url="http://seebk.github.io/GIMP-Lensfun/"
license=('GPL')
depends=('gimp' 'lensfun' 'exiv2')
source=("https://github.com/seebk/GIMP-Lensfun/releases/download/${pkgver}/gimplensfun-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/seebk/GIMP-Lensfun/archive/${pkgver}.tar.gz")
sha256sums=('7a4e6dade910952cdb9afc62f34e286d230dd73c3a1630415c106b5260eb94de')

build() {
	cd ${srcdir}/GIMP-Lensfun-${pkgver}

	make
}

package() {
	cd ${srcdir}/GIMP-Lensfun-${pkgver}

	install -D -m0755 gimp-lensfun ${pkgdir}/usr/lib/gimp/2.0/plug-ins/gimp-lensfun

	install -D -m0644 CHANGES.txt ${pkgdir}/usr/share/doc/gimp-lensfun/CHANGES.txt
	install -D -m0644 LICENSE.txt ${pkgdir}/usr/share/doc/gimp-lensfun/LICENSE.txt
	install -D -m0644 README.txt ${pkgdir}/usr/share/doc/gimp-lensfun/README.txt
}

