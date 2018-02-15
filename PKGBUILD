_name=mizani
pkgname=python-$_name
pkgver=0.4.4
pkgrel=1
pkgdesc='Scales for python'
arch=(any)
url="https://github.com/has2k1/$_name"
license=(BSD)
depends=(
	python
	python-numpy
	python-palettable
	python-matplotlib
	'python-pandas>=0.21.0'
)
makedepends=(python-pip)
_wheel="$_name-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")
noextract=("$_wheel")
sha256sums=('7373086c97d65515a0e575e9a8dd45fb934e3b9ad0e9165a254ca38263e422d4')

package() {
	pip install --compile --no-deps --ignore-installed --root="$pkgdir" "$_wheel"
}
