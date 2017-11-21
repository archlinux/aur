pkgname='python-pptree'
_name='pptree'
pkgver=2.0
pkgrel=1
pkgdesc='Python tree pretty-print '
url="https://github.com/clemtoy/${_name}"
makedepends=('python')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('fbb8c42f7fab308103d93a81b769e472')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	sed -i 's/include_dirs/include_path/' setup.py
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
