# Maintainer: Swiss Privacy Foundation <anonip[at]privacyfoundation[dot]ch>

_pkgname=Anonip
pkgname=anonip
pkgver=1.0.0
pkgrel=1
pkgdesc="Anonip is a tool to anonymize IP-addresses in log-files."
arch=('any')
url="https://github.com/DigitaleGesellschaft/Anonip"
license=('BSD')
depends=('python')
source=("https://github.com/DigitaleGesellschaft/${_pkgname}/archive/v${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('ee34c76817d32aa97cf96451a9005948bddbdaaa0dc93b3583d1fa1ace61d454'
            'bfb9e7ead9baa5171df9f9fe24e93a917cd9903cc9e0bcc3cdf948f33bbb89ad')

package() {
    install -d $pkgdir/usr/share/licenses/$pkgname
    install -m644 -t $pkgdir/usr/share/licenses/$pkgname LICENSE
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
