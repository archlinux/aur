# Maintainer: neodarz <neodarz@neodarz.net>
pkgname=rfc-read
_pkgname=rfc
pkgver=0.2.6
pkgrel=1
pkgdesc='Read RFCs from the command-line '
arch=('any')
url='https://github.com/bfontaine/rfc'
license=('MIT')
groups=()
depends=('bash' 'curl' 'sed' 'less')
conflicts=('rfc' 'rfc-get')
makedepends=('gzip')
source=("https://github.com/bfontaine/rfc/archive/v${pkgver}.tar.gz")
noextract=()
sha512sums=('daab2153c412732ba834261694890488b2a7af342185ab6452daa2a8b8de47febdf49ba55dff433b85e9e60b736a998183214bcd58e970d69162dee886f36cc2')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 rfc "$pkgdir/usr/bin/rfc"
    install -D -m644 man/rfc.1 "$pkgdir/usr/share/man/man1/rfc.1"
}
