# Contributor: Arthur Țițeică | arthur dot titeica with gmail
# Maintaienr: Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=exchangelib
pkgname=python-exchangelib
pkgver=1.9.3
pkgrel=1
pkgdesc="Client for Microsoft Exchange Web Services (EWS)"
arch=(any)
url="https://github.com/ecederstrand/exchangelib"
license=('BSD')
depends=('python' 'python-cached-property' 'python-dnspython' 'python-requests-ntlm' 'python-pytz' 'python-future' 'python-tzlocal')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/5d/53/114b88155999928ced62bee074986f97141e731637980eac0cf5d9d8977c/exchangelib-1.9.3.tar.gz"
"LICENSE")
sha256sums=('3144f2a3b4985b411165acaaabf6728195993cfca081aa22cdc5466ffd5e5073'
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

