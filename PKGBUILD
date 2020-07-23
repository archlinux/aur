# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-fcl-git
pkgver=0.0.12
pkgrel=1
pkgdesc="Python bindings for the Flexible Collision Library"
arch=('x86_64')
url="https://github.com/BerkeleyAutomation/python-fcl"
license=('GPL')
groups=()
depends=('fcl')
makedepends=('python-setuptools')
optdepends=()
provides=('python-fcl')
conflicts=('python-fcl')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/CyrilWaechter/python-fcl" "patch")
noextract=()
md5sums=('SKIP' '5917b8aa6bb6fa468173d3981f616e0a')

prepare() {
	cd $pkgname
	patch --forward --strip=1 --input="${srcdir}/patch" setup.py
}

build() {
	cd $pkgname
    python setup.py build
}

package() {
	cd $pkgname
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
