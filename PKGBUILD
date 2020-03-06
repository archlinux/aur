# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=slack-cleaner2
_pkgname=slack_cleaner2
pkgver=2.0.1
pkgrel=1
pkgdesc='An improved slack cleaner version using a python first approach'
arch=('any')
url='https://slack-cleaner2.readthedocs.io'
license=('MIT')
depends=('python-slacker' 'python-colorama' 'python-dateutil')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sgratzl/${_pkgname}/archive/v$pkgver.tar.gz")
sha256sums=('44919b1de00beab56bc97634f5925de9b066cbcc668398dc345759845ffaea31')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
