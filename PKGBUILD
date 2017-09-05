# Contributor: Arthur Țițeică | arthur dot titeica with gmail
# Maintaienr: Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=exchangelib
pkgname=python-exchangelib
pkgver=1.10.0
pkgrel=1
pkgdesc="Client for Microsoft Exchange Web Services (EWS)"
arch=(any)
url="https://github.com/ecederstrand/exchangelib"
license=('BSD')
depends=('python' 'python-cached-property' 'python-dnspython' 'python-requests-ntlm' 'python-pytz' 'python-future' 'python-tzlocal')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
"LICENSE")
sha256sums=('dfc4023ac5bcfa6c3cbdac44d150d1b8732e392d650c8762d60046f8d7e81199'
            '650d8ac6b0ab9a2c946b021bf12933cad611b6397d0eaff31beb28f6a243afa9')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install -O1 --skip-build --root="${pkgdir}"
    install -Dm0644 ../../LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

