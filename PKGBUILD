# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
pkgname=python-imaplib2
pkgver=3.06
pkgrel=1
pkgdesc="Threaded Python IMAP4 client"
arch=('any')
url="https://github.com/jazzband/imaplib2"
license=('Python')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}::git+https://github.com/jazzband/imaplib2.git#commit=be2c018ddcd0d2d756147558ac0da91d25f1c9c7")
md5sums=('SKIP')

build() {
    cd "${pkgname}"
    python setup.py build
}

package() {
    cd "${pkgname}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    # install README
    install -Dm644 "README" -t "$pkgdir/usr/share/doc/$pkgname"
}
