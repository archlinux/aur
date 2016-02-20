# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=rfc-get
_pkgname=rfc
pkgver=0.1.0
pkgrel=1
pkgdesc='Command-line utility to view RFCs, man-style'
arch=('any')
url='https://github.com/jforberg/rfc'
license=('BSD')
groups=()
depends=('bash' 'curl' 'awk' 'sed' 'less')
makedepends=('gzip')
source=("https://github.com/jforberg/rfc/archive/${pkgver}.tar.gz")
noextract=()
sha1sums=('e7794224f2cf651e1015f1f5052172ea7cba7844')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    gzip -f rfc.1
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 rfc.sh "$pkgdir/usr/bin/rfc"
    install -D -m644 rfc.1.gz "$pkgdir/usr/share/man/man1/rfc.1.gz"
}

