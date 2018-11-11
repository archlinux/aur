# Maintainer: Ainola
# Contributor: Anthony Samartsev

pkgname=xcursor-pixelfun3
epoch=1
pkgver=1.3
pkgrel=1
pkgdesc="Minimalistic cursor theme with a piece of old-school"
arch=('any')
url="https://www.gnome-look.org/p/1190830/"
license=('unknown')  # No license provided
makedepends=('curl')
# opendesktop.org-based platforms constantly change two chunks of their source
# URL. We must get both values from the same call.
_tstamps=($(curl -s "$url" | grep -e "hash =" -e 'timetamp =' | sed "s/.*= '\\(.*\\)';/\\1/"))
source=("$pkgname-$pkgver.tar.gz::https://dl.opendesktop.org/api/files/download/id/1505142083/s/${_tstamps[0]}/t/${_tstamps[1]}/u//168338-pixelfun3.tar.gz")
sha256sums=('05cb3a14a2e32640c9e0fb9567df8c27b483d7e3cff72751720825a8266e5496')

package() {
    mkdir -p "$pkgdir/usr/share/icons"
    cp -r pixelfun3 "$pkgdir/usr/share/icons/"
    find "$pkgdir/usr/share/icons/pixelfun3" -type f -exec chmod 644 {} +
    find "$pkgdir/usr/share/icons/pixelfun3" -type d -exec chmod 755 {} +
}
