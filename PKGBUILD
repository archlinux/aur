# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=jupyter_kernel_test
pkgname=python-$_name
pkgver=0.2.2
pkgrel=1
pkgdesc=''
arch=('any')
url="https://github.com/jupyter/$_name"
license=('')
depends=('python' 'jupyter' 'ipython' 'python-nose')  # ipython contains traitlets for some reason
makedepends=('python-pip')
_wheel="$_name-$pkgver-py2.py3-none-any.whl"
source=("https://pypi.python.org/packages/09/f7/101f866f27c88242f4e146e4ee5712285916ecc5c43bfed4d781bb663fd4/$_wheel")  # wtf?
#source=("https://pypi.python.org/packages/py2.py3/j/$_name/$_wheel")
noextract=("$_wheel")
md5sums=('4cc7e539059c10681b2d67604f3fd302')

package() {
	pip install --compile --no-deps --root="$pkgdir" "$_wheel"
}
