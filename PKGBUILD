_name=toml
pkgbase=python-$_name
pkgname=(python-$_name python2-$_name)
pkgver=0.9.4
pkgrel=3
pkgdesc='Parse and emit TOML'
arch=(any)
url="https://github.com/uiri/$_name"
license=(MIT)
makedepends=(python python2)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8e86bd6ce8cc11b9620cb637466453d94f5d57ad86f17e98a98d1f73e3baab2d')

prepare() {
	mkdir -p "$_name-$pkgver-py2"
	cp -Tr "$_name-$pkgver"{,-py2}
}

package_python-toml() {
	cd "$_name-$pkgver"
	depends=(python)
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}

package_python2-toml() {
	cd "$_name-$pkgver-py2"
	depends=(python2)
	python2 setup.py install --root="$pkgdir" --optimize=1 || return 1
}
