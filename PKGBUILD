# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=nml
pkgver=0.5.2
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
sha256sums=("31b931dd7b052b23cac9fdb465be87ad3ecb4c6417ee61ab58dfd7bd7e99f5bb")
noextract=()
md5sums=()
validpgpkeys=()

prepare()
{
	cd "${pkgname}-${pkgver}"
	patch -p1 -i "${startdir}/nml-0.5.2-set-version.patch"
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
