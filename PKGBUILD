# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=python-xdis
pkgver=3.8.0
pkgrel=1
pkgdesc="Python cross-version byte-code disassembler and marshal routines."
arch=('any')
url="https://github.com/rocky/python-xdis/"
license=('MIT')
makedepends=('python-setuptools' 'git')
depends=('python-click')
source=('git+https://github.com/rocky/python-xdis.git#commit=e3940affc511131f96e17f37c29f1d1bfa94c86d'
        'python-xdis-supports-3.6.5.patch')
sha256sums=('SKIP'
            'c3ed1a3c3fdd67d6c7ab75981367ad062a9ef44fe23f8617fc0585057479f5fa')
build() {
    cd "$srcdir/$pkgname"
    patch -p1 < "$srcdir/${source[1]}"
    python setup.py build
}
package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir"
}
