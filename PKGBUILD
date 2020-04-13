# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=nml
pkgver=0.4.5
pkgrel=3
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
source=("nml-${pkgver}.tar.gz::http://bundles.openttdcoop.org/nml/releases/${pkgver}/nml-${pkgver}.tar.gz")
sha256sums=("a3f04086078fb568af3f4031907582b2713730c4952074947bf6daa747ddbbde")
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$startdir/nml-pillow-6.0.patch"
	patch -p1 -i "$startdir/nml-process-time.patch"
}

build()
{
	cd "$pkgname-$pkgver"
	python setup.py build
}

package()
{
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
