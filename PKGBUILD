# Maintainer: Szymon Scholz < szymonscholz at gmail dot com >
# Contributor: Jo De Boeck <deboeck.jo@gmail.com>
# Original Maintainer: Julien Humbert <julroy67@gmail.com>
# Contributor: danyf90
# Contributor: hermes14
pkgname=superbeam
pkgver=5.0.3
pkgrel=1
pkgdesc="The easiest and fastest way to share files with Android"
arch=('any')
url="http://superbe.am/"
license=('custom')
depends=('java-environment' 'bash')
makedepends=('gendesk')
source=(http://superbe.am/download/5294)

prepare(){
	gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name="SuperBeam" --categories="Network"
}

package() {
mkdir -p "$pkgdir/usr/bin"
install -Dm755 "$srcdir/SuperBeam-5.0.3-linux.sh" "$pkgdir/usr/bin/superbeam"
install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
install -Dm644 "$srcdir/SuperBeam.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
install -Dm644 "$srcdir/README" "$pkgdir/usr/share/doc/$pkgname/README"
}

md5sums=('ab48dd63bb2c0a0b7a7e4d06bb2dfec5')
