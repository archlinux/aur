# Maintainer: codl <codl@codl.fr>
# Contributor: Michael Lawson <mdlawson@gmx.com>

pkgname=ibus-uniemoji
pkgver=0.6.0
pkgrel=3
pkgdesc="A simple input method for ibus that allows you to enter unicode emoji and other symbols by name"
arch=(i686 x86_64)
url="https://github.com/salty-horse/ibus-uniemoji"
license=('GPL')
depends=('python' 'ibus')
conflicts=('ibus-uniemoji-git')
optdepends=('python-levenshtein:  faster fuzzy search')
source=("https://github.com/salty-horse/ibus-uniemoji/archive/v${pkgver}.tar.gz")
sha256sums=('295a698e6065366d06d54786a272ac69417f709053cfe32bf42520dc5311052a')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    PREFIX=/usr make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    DESTDIR=$pkgdir/ make install
}
