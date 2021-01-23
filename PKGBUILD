# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=patternutils
pkgver=0.0.11
_pkghash=845246bd20d9
pkgrel=1
pkgdesc="Combine regular expressions with template engines in a powerful matter."
arch=('any')
url="https://projects.metalgamer.eu/patternutils"
license=('GPL3')
depends=('python' 'python-click' 'python-jinja' 'python-pygments' 'python-feedparser')
source=('patternutils-0.0.11.zip::https://projects.metalgamer.eu/patternutils/archive/845246bd20d99082f1809ce02426a9276bf041f9.zip?subrepos=false')
sha512sums=('77bf4e5b7f70dc29325e4b9e396f715ff6e0d346f630f3b4b7a2b485bb74c7f6d5a6c7107d52ca02611c63487c46cdc7fcc3773fde31cbe4abbf8c7c44c9df58')

prepare() {
    sed -i 's/==/>=/g' "$srcdir/$pkgname-$_pkghash/setup.py"
}

build() {
    cd "$srcdir/$pkgname-$_pkghash"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$_pkghash"
    python setup.py install --root="$pkgdir" --optimize=1
}
