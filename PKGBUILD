# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-olca-ipc
_name=${pkgname#python-}
pkgver=0.0.10
pkgrel=1
pkgdesc="API for communicating with an openLCA IPC server"
arch=('x86_64')
url="https://github.com/GreenDelta/olca-ipc.py"
license=('MPL2')
groups=()
depends=()
makedepends=('python-setuptools')
optdepends=()
provides=('python-olca-ipc')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
noextract=()
md5sums=('cb95989c211c99881cdf701deb549566')

build() {
	cd ${_name}-${pkgver}
    python setup.py build
}

package() {
	cd ${_name}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
