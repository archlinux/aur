_name=mizani
pkgname=python-$_name
pkgver=0.5.2
pkgrel=1
pkgdesc='Scales for python'
arch=(any)
url="https://github.com/has2k1/$_name"
license=(BSD)
depends=(
	python
	python-numpy
	'python-pandas>=0.23.4'
	python-matplotlib
	python-palettable
)
makedepends=(python-pip)
_wheel="$_name-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
noextract=("$_wheel")
sha256sums=('52b6ead2633ff04c30dfba0fe3b662aa8d8291c1a64c9d37328d0dd99bbe8a63')

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
