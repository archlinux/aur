# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-fear-greed-index
_pkgname=${pkgname:7}
pkgver=0.1.4
pkgrel=1
pkgdesc="CNN Fear and Greed Index"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(
    python
    python-sphinx-alabaster-theme
    python-babel
    python-beautifulsoup4
    python-bs4
    python-certifi
    python-charset-normalizer
    python-cycler
    python-docutils
    python-idna
    python-imagesize
    python-jinja
    python-kiwisolver
    python-lxml
    python-m2r2
    python-markupsafe
    python-matplotlib
    python-mistune
    python-numpy
    python-packaging
    python-pillow
    python-poetry
    python-pygments
    python-pyparsing
    python-dateutil
    python-pytz
    python-requests
    python-six
    python-snowballstemmer
    python-soupsieve
    python-sphinx_rtd_theme
    python-sphinx
    python-sphinxcontrib-applehelp
    python-sphinxcontrib-devhelp
    python-sphinxcontrib-htmlhelp
    python-sphinxcontrib-jsmath
    python-sphinxcontrib-qthelp
    python-sphinxcontrib-serializinghtml
    python-urllib3
)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('3eca4a50aa5f7ac76ce1ea7581adef322cdbfb61fb1bf0622f4aac914fdf9f1f')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
