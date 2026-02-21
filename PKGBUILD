# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=nml
pkgver=0.8.1
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
	"nml-0.8.1-set-version.patch")
sha256sums=("d8d3efac1396e61d8a3a5e8b39b2015c8742fddd96b76689ab898062022d72b0"
	"afe75ee57633026972a2617c2f8023e0a364eab57b5df3f1079af149dee4112d")
noextract=()
md5sums=()
validpgpkeys=()

prepare()
{
	cd "${pkgname}-${pkgver}"
	patch -p1 -i ../nml-0.8.1-set-version.patch
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
