# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-sentiment-investor
_pkgname=${pkgname:7}
pkgver=2.1.0
pkgrel=1
pkgdesc="Access the Sentiment Investor API through Python"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-poetry)
depends=(python python-requests python-websocket-client python-beartype)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('1b1969058ed540ef7059a54c146bc7b1e424b55c405607d4b407d476e562504e')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
