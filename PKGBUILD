# Maintainer: Florijan Hamzic <florijanh at gmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pypi_name=WeasyPrint
pkgname=python-${_pypi_name,,}
pkgver=52.5
pkgrel=3
pkgdesc='Convert web documents (HTML, CSS, SVG, ...) to PDF'
license=('BSD')
arch=('any')
url='http://weasyprint.org'
_py_deps=(cairo cairocffi cairosvg cffi cssselect2 html5lib pillow pyphen pytest-runner tinycss2)
depends=(python "${_py_deps[@]/#/python-}")
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pypi_name::1}/$_pypi_name/$_pypi_name-$pkgver.tar.gz")
sha256sums=('b37ea02d75ca04babd7becad7341426be332ae560d8f02d664bfa1e9afb18481')

build() {
    cd "$_pypi_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_pypi_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
