# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-clr_loader
_name=${pkgname#python-}
pkgver=0.1.7
pkgrel=1
pkgdesc="Generic pure Python loader for .NET runtimes"
arch=('any')
url="https://github.com/pythonnet/clr-loader"
license=('MIT')
depends=('python' 'python-cffi')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name}-$pkgver.tar.gz")
sha256sums=('bd1967d3cf80368c7d890a332704f169c5d2b5d7141635f1dae84d7d40346d51')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
