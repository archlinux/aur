# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>

pkgbase=in-toto
pkgname=('in-toto')
pkgver=0.1.1
pkgrel=1
pkgdesc="A framework to secure your software supply chain"
arch=('any')
license=('MIT')
url="https://in-toto.io"
provides=("in-toto=$pkgver")
depends=('python-cryptography')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("git+https://github.com/in-toto/in-toto#commit=460d9de97c8c802b6d3a9eb06978653a808485dd")
sha512sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1
}
