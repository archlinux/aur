# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-dot-kernel
_name=dot_kernel
pkgver=0.1.8
pkgrel=1
pkgdesc="Writing dot language and render in jupyter"
arch=('any')
url="https://github.com/laixintao/jupyter-dot-kernel"
license=('unknown')
makedepends=()
depends=('python-graphviz' 'python-jupyter-client' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	'https://github.com/laixintao/jupyter-dot-kernel/raw/master/readme.md')
sha256sums=('6bf5910b24e1068458ca181257e0a169fa19baf54965e61df9ba1cbb729dbdbf'
	'7347BDEAD32D46FC357B352958A4CCCAD4DD025856233F6032BDDD3096079DC1')

build() {
	cp readme.md "$_name-$pkgver"
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
