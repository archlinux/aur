# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=nml
pkgver=0.5.0
pkgrel=1
epoch=
pkgdesc="OpenTTD NewGRF Meta Language Tools"
arch=("any")
url="https://dev.openttdcoop.org/projects/nml"
license=("GPL")
groups=()
depends=("python-ply" "python-pillow")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("nml-${pkgver}.tar.gz::https://github.com/OpenTTD/nml/archive/${pkgver}.tar.gz")
sha256sums=("156d2641097f10ae03134873417d37634fa2a81fff110edcf6fb472907f4367f")
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
	cd "${pkgname}-${pkgver}"
	patch -p1 -i "${startdir}/nml-0.5.0-set-version.patch"
}

build()
{
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package()
{
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
