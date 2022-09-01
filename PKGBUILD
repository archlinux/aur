# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=nml
pkgver=0.7.0
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
source=("nml-${pkgver}.tar.gz::https://github.com/OpenTTD/nml/archive/${pkgver}.tar.gz")
sha256sums=("bd2e29db6ea6d0c89118673be097d4dd48c83604279900d17cd1e332d6fe6184")
noextract=()
md5sums=()
validpgpkeys=()

prepare()
{
	cd "${pkgname}-${pkgver}"
	patch -p1 -i "${startdir}/nml-0.7.0-set-version.patch"
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
