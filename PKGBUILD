# Maintainer: Vladislav Glinsky <cl0ne[at]mithril.org.ua>
# Contributor: Pavel <otchertsov@gmail.com>

pkgname=pidgin-quote-text
pkgver=0.9.3
pkgrel=2
pkgdesc="Quote selected message into the entry area"
arch=('any')
url="https://launchpad.net/quote/"
license=('GPL2')
depends=('pidgin')
source=(
    'git://github.com/pomozoff/quotetext.git'
    'replace_internal_h.patch'
    'Makefile'
)
md5sums=(
    'SKIP'
    '876d904e0dd3a65acda07a0de0218267'
    'ea42e6a112fc97896f5b09fe12e27fd6'
)

build()
{
    mv "${srcdir}/Makefile" "${srcdir}/quotetext/"
    cd "${srcdir}/quotetext"
    patch -p0 < "${srcdir}/replace_internal_h.patch"
    make
}

package()
{
    cd "${srcdir}/quotetext"
    make DESTDIR="$pkgdir/usr" install
}
