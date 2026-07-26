# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=nml
pkgver=0.9.0
pkgrel=1
epoch=
pkgdesc="OpenTTD NewGRF Meta Language Tools"
arch=("any")
url="https://github.com/OpenTTD/nml"
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
source=("nml-${pkgver}.tar.gz::https://github.com/OpenTTD/nml/archive/${pkgver}.tar.gz"
	"nml-0.9.0-set-version.patch")
sha256sums=("c60232f48b05b5bf15918e597a15e97192634b1d4b84bcf0a1f829f167a8d7d8"
	"d36d8bed287b95bb8e8b3acf6dd187f1dd17ab27a1ade08d583af8dbe7799a9d")
noextract=()
md5sums=()
validpgpkeys=()

prepare()
{
	cd "${pkgname}-${pkgver}"
	patch -p1 -i ../nml-0.9.0-set-version.patch
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
