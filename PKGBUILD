# Maintainer: @RubenKelevra <cyrond@gmail.com>

pkgname='python-scantree'
_module=${pkgname#python-}
pkgver='0.0.4'
pkgrel=1
pkgdesc='Flexible recursive directory iterator: scandir meets glob("**", recursive=True)'
url="https://github.com/andhus/scantree"
depends=('python>=3.14'
         'python-attrs'
         'python-pathspec')
makedepends=('python-setuptools'
	     'python-versioneer')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('13573fd279686e2ec1d8b1f1a11b1639adb431f977dd4e42b9f24632cf0fcf509488dd814b81b1f7be2bc6bf6bdda3ad4c0bbc20aa225e67e088bcb088d590ef')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-scantree/LICENSE"
	python setup.py install --root="${pkgdir}" --optimize=2 --skip-build
}
