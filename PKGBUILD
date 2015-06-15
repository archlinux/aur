# Maintainer: Wijnand Modderman-Lenstra <maze@pyth0n.org>
pkgname=x84
pkgver=2.0.12
pkgrel=1
pkgdesc="Telnet server for UTF-8 and cp437 terminals"
arch=(any)
url="https://github.com/jquast/x84"
license=('ISC')
groups=()
depends=('python2' 'python2-requests' 'python2-sauce' 'python2-sqlitedict' 'python2-py-bcrypt')
makedepends=('python2')
optdepends=()
install=
changelog=
source=(https://pypi.python.org/packages/source/x/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5e8a74e9082a40677af924478872047c')
sha1sums=('30dcd3baf50fb41910c07b1ddac325102f734bb6')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -e 's!^python !/usr/bin/env python2 !' -i bin/x84
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
