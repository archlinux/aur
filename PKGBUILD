# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Daniel <danilacasito8@gmail.com>
pkgname=python-dlock13
pkgver=0.4.1
pkgrel=1
epoch=
pkgdesc="Python API for MQTT-based doorlocks"
arch=(x86_64)
url="https://pypi.org/project/dlock13"
license=('GPL')
groups=()
depends=(python-paho-mqtt)
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
source=("https://files.pythonhosted.org/packages/4c/c7/43427bedcc7b1f4e2f7c6e714c8061a9c0805434e760f34b177c19953697/dlock13-0.4.1.tar.gz" "dlock13-0.4.1-skip_readme.patch")
noextract=()
md5sums=(70a15c31a19518c02607b2502fbc95f7 1e31e638af1a0ed87a6cc84d30cc5f16)
validpgpkeys=()
prepare() {
	cd "dlock13-$pkgver"
	patch < ../dlock13-0.4.1-skip_readme.patch
}
build() {
	cd "dlock13-$pkgver"
	python setup.py build
}

package() {
	cd "dlock13-$pkgver"
	python setup.py install --root $pkgdir
}
