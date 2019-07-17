# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-streamz')
_pkgname='streamz'
pkgver='0.5.1'
pkgrel=1
pkgdesc="Real-time processing for python"
url="https://streamz.readthedocs.io"
checkdepends=('python-pytest')
depends=('python' 'python-tornado' 'python-toolz' 'python-zict')
makedepends=('python-setuptools')
optdepends=()
license=('BSD')
arch=('any')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('80c9ded1d6e68d3b78339deb6e9baf93a633d84b4a8875221e337ac06890103f')

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    pytest
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
