# Maintainer: Ainola
# Contributor: Anthony Samartsev

pkgname=xcursor-pixelfun
pkgver=3.2
pkgrel=9
pkgdesc="Minimalistic cursor theme with a piece of old-school"
arch=('any')
url="https://www.gnome-look.org/p/999913/"
license=('Custom')  # No license provided
makedepends=('curl')
# opendesktop.org-based platforms constantly change two chunks of their source
# URL. We must get both values from the same call.
_tstamps=($(curl -s "$url" | grep -e "hash =" -e 'timetamp =' | sed "s/.*= '\\(.*\\)';/\\1/"))
source=("$pkgname-$pkgver.tar.gz::https://dl.opendesktop.org/api/files/download/id/1461762510/s/${_tstamps[0]}/t/${_tstamps[1]}/u//168338-pixelfun3.tar.gz")
sha256sums=('0252dc14d5771d3338f38bd5febd3afd53ee8f8d2588b0c26d32e766df9622bd')

package() {
    mkdir -p "$pkgdir/usr/share/icons"
    cp -r pixelfun3 "$pkgdir/usr/share/icons/"
    find "$pkgdir/usr/share/icons/pixelfun3" -type f -exec chmod 644 {} +
    find "$pkgdir/usr/share/icons/pixelfun3" -type d -exec chmod 755 {} +
}
