# Maintainer: Niklas <dev@n1klas.net>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgname='python2-sockjs-tornado'
_module='sockjs-tornado'
pkgver='1.0.3'
pkgrel=1
pkgdesc="SockJS python server implementation on top of Tornado framework"
url="http://github.com/mrjoes/sockjs-tornado/"
depends=('python2' 'python2-tornado')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('6d726e61bd1d884bd1c1788727fce1b9f24fd69062dda0daf61a476b01718e99')

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
