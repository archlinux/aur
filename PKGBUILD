# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-hvplot')
_pkgname='hvplot'
pkgver='0.4.0'
pkgrel=1
pkgdesc="A high-level plotting API build on HoloViews"
url="https://hvplot.pyviz.org"
checkdepends=('python-nose' 'python-parameterized')
depends=('python' 'python-bokeh' 'python-holoviews' 'python-pandas')
makedepends=('python-setuptools')
optdepends=()
license=('BSD')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('bce169cf2d1b3ff9ce607d1787f608758e72a498434eaa2bece31eea1f51963a')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    nosetests
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
