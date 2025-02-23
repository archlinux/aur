# Maintainer: infeeeee <infeeeee at aaathats3as dot com>
# Contributor: codl <codl@codl.fr>
# Contributor: Michael Lawson <mdlawson@gmx.com>

pkgname=ibus-uniemoji
pkgver=0.7.0
pkgrel=2
pkgdesc="A simple input method for ibus that allows you to enter unicode emoji and other symbols by name"
arch=(i686 x86_64)
url="https://github.com/salty-horse/ibus-uniemoji"
license=('GPL-3.0-only' 'MIT' 'Unicode-3.0')
depends=('python' 'ibus')
conflicts=('ibus-uniemoji-git')
optdepends=('python-levenshtein:  faster fuzzy search')
source=("https://github.com/salty-horse/ibus-uniemoji/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d3fc02a6abc7719f0abb5336cf6333677dd3451ff7508ebc30947528c577746d')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    PREFIX=/usr make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    DESTDIR=$pkgdir/ make install
}
