# Maintainer: codl <codl@codl.fr>
# Contributor: Michael Lawson <mdlawson@gmx.com>

pkgname=ibus-uniemoji
pkgver=0.5.0
pkgrel=2
pkgdesc="A simple input method for ibus that allows you to enter unicode emoji and other symbols by name"
arch=(i686 x86_64)
url="https://github.com/lalomartins/ibus-uniemoji"
license=('GPL')
depends=('python' 'libibus')
conflicts=('ibus-uniemoji-git')
optdepends=('python-levenshtein:  faster fuzzy search')
source=("https://github.com/salty-horse/ibus-uniemoji/archive/v${pkgver}.tar.gz")
sha256sums=('647e3b2c3882ef87229f8272eadaaa08a532dfcfba0c563302efec1570df50ea')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p $pkgdir/usr/share/ibus-uniemoji $pkgdir/etc/xdg/uniemoji
    cp uniemoji.py uniemoji.svg UnicodeData.txt $pkgdir/usr/share/ibus-uniemoji
    chmod a+x $pkgdir/usr/share/ibus-uniemoji/uniemoji.py
    mkdir -p $pkgdir/usr/share/ibus/component
    cp uniemoji.xml $pkgdir/usr/share/ibus/component
}
