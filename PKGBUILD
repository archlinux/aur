# Maintainer: Nicolas Marot <nicolas dot marot at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=slack-cleaner2
_pkgname=slack_cleaner2
pkgver=3.2.0
pkgrel=1
pkgdesc='An improved slack cleaner version using a python first approach'
arch=('any')
url='https://slack-cleaner2.readthedocs.io'
license=('MIT')
depends=('python-slacker' 'python-colorama' 'python-dateutil' 'python-slack-sdk')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sgratzl/${_pkgname}/archive/v$pkgver.tar.gz")
sha256sums=('8973cc9e4ca5229d53c9fe162ec6aa06120ae8cfd75ef938d224df72a53ca7dc')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python setup.py install --root="$pkgdir" --optimize=1
}
