# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
pkgname=python-contextvars
pkgver=2.4
pkgrel=1
epoch=
pkgdesc="PEP 567 Backport"
arch=(any)
url="https://github.com/MagicStack/contextvars"
license=('custom')
groups=()
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-immutables')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
md5sums=('5907c5c866d9ac75563c90b0b7953b04')
validpgpkeys=()

prepare() {
	cd "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver"
	python setup.py test
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	mkdir -p $pkgdir/usr/share/licenses/${pkgname}/
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/
}
