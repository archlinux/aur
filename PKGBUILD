# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname='python-skyfield'
_name=${pkgname#python-}
pkgver='1.45'
pkgrel=2
pkgdesc="Elegant astronomy for Python"
url="https://rhodesmill.org/skyfield/"
depends=('ipython' 'python-certifi' 'python-jplephem' 'python-matplotlib' 'python-pandas' 'python-sgp4' 'python-sympy')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('5f0e0530bda6c9bf23a188c574181b4ee63cf2ce1ec1e0c8825f45ae577d8b36')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	depends+=()
	cd "${srcdir}/${_name}-${pkgver}"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

