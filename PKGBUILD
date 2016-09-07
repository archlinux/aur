# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=jupyter_kernel_test
pkgname=python-$_name
pkgver=0.2.2
pkgrel=2
pkgdesc=''
arch=('any')
url="https://github.com/jupyter/$_name"
license=('')
depends=('python' 'jupyter' 'ipython' 'python-nose')  # ipython contains traitlets for some reason
makedepends=('python-pip')
_wheel="$_name-$pkgver-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/$_wheel")  # wtf?
noextract=("$_wheel")
md5sums=('4cc7e539059c10681b2d67604f3fd302')

package() {
	pip install --compile --no-deps --root="$pkgdir" "$_wheel"
}
