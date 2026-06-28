pkgname='python-drastic'
_name='drastic'
pkgver=1.2
pkgrel=1
pkgdesc='Reduce the size of your Python code and increase its robustness'
url="https://github.com/clemtoy/${_name}"
makedepends=('python')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('44ffdd4855f0e6f8a09a3e4e9fe5baec')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	sed -i 's/include_dirs/include_path/' setup.py
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
