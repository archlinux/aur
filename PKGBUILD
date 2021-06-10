# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
pkgname=python-imaplib2
pkgver=3.6
pkgrel=2
pkgdesc="Threaded Python IMAP4 client"
arch=('any')
url="https://github.com/jazzband/imaplib2"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}::git+https://github.com/jazzband/imaplib2.git#tag=v3.6")
md5sums=('SKIP')

build() {
    cd "${pkgname}"
    python setup.py build
}

package() {
    cd "${pkgname}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    # install README
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"

    # install license
    install -Dm644 "LICENCE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
