# Maintainer: Arne Ludwig < arne.ludwig at posteo dot de >
# Maintainer: Szymon Scholz < szymonscholz at gmail dot com >
# Contributor: Jo De Boeck <deboeck.jo@gmail.com>
# Original Maintainer: Julien Humbert <julroy67@gmail.com>
# Contributor: danyf90
# Contributor: hermes14
pkgname=superbeam
pkgver=5.1.1
pkgrel=1
pkgdesc="The easiest and fastest way to share files with Android"
arch=('any')
url="http://superbe.am/"
license=('custom')
depends=('java-environment' 'java8-openjfx' 'bash')
makedepends=('gendesk')
source=(http://superbe.am/download/5294)

prepare(){
	gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name="SuperBeam" --categories="Network"
}

package() {
mkdir -p "$pkgdir/usr/bin"
install -Dm755 "$srcdir/SuperBeam-${pkgver}-linux.sh" "$pkgdir/usr/bin/superbeam"
install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
install -Dm644 "$srcdir/SuperBeam.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
install -Dm644 "$srcdir/README" "$pkgdir/usr/share/doc/$pkgname/README"
}

md5sums=('4f1bb012294dc6b999d8d0dacb472240')
