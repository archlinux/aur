# Maintainer: Miodrag Tokić

pkgname=slack-cleaner
pkgver=0.7.3
pkgrel=1
pkgdesc='Delete slack message and files'
arch=('any')
url='https://github.com/sgratzl/slack-cleaner'
license=('MIT')
depends=('python' 'python-slacker' 'python-colorama')
makedepends=('python-setuptools')
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/sgratzl/slack-cleaner/archive/v$pkgver.tar.gz")
sha256sums=('7ca12bbd524fcb7885a76d0de8335e702f915cc3b93e945d0157291976334fd3')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
