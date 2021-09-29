# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=nml
pkgver=0.6.1
pkgrel=1
epoch=
pkgdesc="OpenTTD NewGRF Meta Language Tools"
arch=("any")
url="https://dev.openttdcoop.org/projects/nml"
license=("GPL")
groups=()
depends=("python-ply" "python-pillow" "python-setuptools" )
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
sha256sums=("7d7487980bf63a7874a6fb21474be27edf528cea48c676a4e461c1368f2a0d7d")
noextract=()
md5sums=()
validpgpkeys=()

prepare()
{
	cd "${pkgname}-${pkgver}"
	patch -p1 -i "${startdir}/nml-0.6.1-set-version.patch"
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
