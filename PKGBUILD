# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
pkgname=x84
pkgver=2.0.15
pkgrel=1
pkgdesc="Telnet server for UTF-8 and cp437 terminals"
arch=(any)
url="https://github.com/jquast/x84"
license=('ISC')
groups=()
depends=(
    'python2' 
    'python2-requests' 
    'python2-sauce' 
    'python2-sqlitedict' 
    'python2-bcrypt' 
    'python2-html2text'
)
makedepends=('python2')
optdepends=()
install=
changelog=
source=(https://pypi.python.org/packages/source/x/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('c98be9a186aad098d896055f8dbf0f431f0774e5')
sha256sums=('59210511ac09aeab68783916a3455e10d86b65c334bbb0f3bc38ee25d57ae6f1')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -e 's!^python !/usr/bin/env python2 !' -i x84/engine.py
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
