# Maintainer: Miodrag Tokić

pkgname=slack-cleaner
pkgver=0.5.0
pkgrel=1
pkgdesc='Delete slack message and files'
arch=('any')
url='https://github.com/sgratzl/slack-cleaner'
license=('MIT')
depends=('python' 'python-slacker' 'python-colorama')
makedepends=('python-setuptools')
options=(!emptydirs)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/sgratzl/slack-cleaner/archive/v$pkgver.tar.gz"
)
sha256sums=(
    '1b8ec5e216e7e96078490b1645b7a9e274f001449bb9fa18e1ef00c7f352da7a'
)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
