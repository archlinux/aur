# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=python-clr_loader
_name=${pkgname#python-}
pkgver=0.1.6
pkgrel=1
pkgdesc="Generic pure Python loader for .NET runtimes"
arch=('any')
url="https://github.com/pythonnet/clr-loader"
license=('MIT')
depends=('python' 'python-cffi')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name}-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
