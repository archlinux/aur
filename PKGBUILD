# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
pkgname=python-immutables
pkgver=0.15
pkgrel=1
epoch=
pkgdesc="A high-performance immutable mapping type for Python"
arch=(x86_64)
url="https://github.com/MagicStack/immutables"
license=('custom')
groups=()
depends=('python')
makedepends=('python-setuptools')
checkdepends=('flake8' 'python-pycodestyle')
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
md5sums=('64628c8d813a4b3e954ef2af531eddc6')
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
	python -m unittest -v
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	mkdir -p $pkgdir/usr/share/licenses/${pkgname}/
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/
}
