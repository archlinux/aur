# Maintainer: Swiss Privacy Foundation <anonip[at]privacyfoundation[dot]ch>

_pkgname=Anonip
pkgname=anonip
pkgver=1.1.0
pkgrel=1
pkgdesc="Anonip is a tool to anonymize IP-addresses in log-files."
arch=('any')
url="https://github.com/DigitaleGesellschaft/Anonip"
license=('BSD')
depends=('python')
source=("https://github.com/DigitaleGesellschaft/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3511892021367165a13fffcb4483b4fc85a004d888708e2e365b514554779012')

package() {
    install -d $pkgdir/usr/share/licenses/$pkgname
    install -m644 -t $pkgdir/usr/share/licenses/$pkgname "${_pkgname}-${pkgver}/LICENSE.txt"
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
