# Maintainer: Miodrag Tokić

pkgname=slack-cleaner
pkgver=0.7.0
pkgrel=1
pkgdesc='Delete slack message and files'
arch=('any')
url='https://github.com/sgratzl/slack-cleaner'
license=('MIT')
depends=('python' 'python-slacker' 'python-colorama')
makedepends=('python-setuptools')
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/sgratzl/slack-cleaner/archive/v$pkgver.tar.gz")
sha256sums=('d5c7349599d67acf230ffdc46270317f7168f662166f663f0bb3bb51d60d65ad')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
