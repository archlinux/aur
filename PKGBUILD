# Maintainer: Kevin Kuehler <keur@ocf.berkeley.edu>

_pkgname=termgraph
pkgname="$_pkgname-git"
pkgver=0.2.0.r4.gc40b864
pkgrel=1
pkgdesc="A python command-line tool which draws basic graphs in the terminal."
arch=('x86_64')
url="https://github.com/mkaz/$_pkgname"
license=('MIT')
depends=('python')
makedepends=('python')
provides=('termgraph')
conflicts=('termgraph')
source=("$_pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
