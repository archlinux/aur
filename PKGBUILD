# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=TestSlide
pkgname=python-${_name,,}
pkgver=2.7.0
pkgrel=1
pkgdesc="A test framework for Python"
arch=('any')
url="https://testslide.readthedocs.io"
license=('MIT')
depends=(
    'python-psutil'
    'python-pygments'
    'python-typeguard'
    'python-dataclasses'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('23ece0b9f5b704b33b978e9c8797936034516adc3c4743ebdaed664aa700c3cb')

package() {
	cd "$srcdir/$_name-$pkgver"

	install -D -m644 \
		"${srcdir}/$_name-$pkgver/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	python setup.py install --optimize=1 --root="$pkgdir"
}
