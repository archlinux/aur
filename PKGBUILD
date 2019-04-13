# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-asciimatics
pkgver=1.10.0
pkgrel=1
pkgdesc='A cross platform package to do curses-like operations, plus higher level APIs and widgets to create text UIs and ASCII art animations.'
arch=('any')
url='https://pypi.org/project/asciimatics'
license=('Apache2')
depends=('python-wcwidth' 'python-mock' 'python-pyfiglet' 'python-future' 'python-setuptools-scm' 'python-pillow')
_pkgname=asciimatics
source=("https://files.pythonhosted.org/packages/source/a/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('361c578f57d1c92e40ba0a9cd6c63e55')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root "$pkgdir"
	install -Dm644 "$srcdir/${_pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
