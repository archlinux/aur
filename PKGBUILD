# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=patternutils
pkgver=0.0.12
pkgrel=1
pkgdesc="Combine regular expressions with template engines in a powerful matter."
arch=('any')
url="https://projects.metalgamer.eu/patternutils"
license=('GPL3')
depends=('python' 'python-click' 'python-jinja' 'python-pygments' 'python-feedparser')
source=('https://download.metalgamer.eu/patternutils/patternutils-0.0.12.tar.gz')
sha512sums=('2d39fce29eda388436f2c11da1df8016436f0441e1c77c53aa1b7fa863e7862073629ee4dfb7d082abea0b70760c2535554fec0a0bfc6cd8674f688c6f37c771')

prepare() {
    sed -i 's/==/>=/g' "$srcdir/$pkgname-$pkgver/setup.py"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
