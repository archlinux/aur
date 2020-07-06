# Maintainer: Miodrag Tokić

pkgname=slack-cleaner
pkgver=0.7.4
pkgrel=1
pkgdesc='Delete slack message and files'
arch=('any')
url='https://github.com/sgratzl/slack-cleaner'
license=('MIT')
depends=('python' 'python-slacker' 'python-colorama')
makedepends=('python-setuptools')
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/sgratzl/slack-cleaner/archive/v$pkgver.tar.gz")
sha256sums=('1edfa318e2562d5c53eb0d01f272fbdd909d60181616a02741159c6bb63247a5')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
