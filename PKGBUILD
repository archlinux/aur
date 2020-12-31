# Maintainer: SanskritFritz (gmail)

pkgname=globonote
pkgver=1.6
pkgrel=1
pkgdesc="Create sticky notes, to-do lists, reminders and other notes in one place."
arch=(any)
url="http://globonote.info/"
license=('GPLv2')
depends=('java-runtime')
source=("http://sourceforge.net/projects/globonote/files/globonote/GloboNote-$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.sh" "$pkgname.desktop")

package() {
	cd "$srcdir/GloboNote"
	mkdir --parents "$pkgdir/usr/share/java/$pkgname"
	cp --recursive * "$pkgdir/usr/share/java/$pkgname/"
	install -Dm0755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

md5sums=('b1dde640182172a9541f86828e50617e'
         '6355ec8b0545e8853e3a441a7caaf200'
         '3d72cd1aa49d00c9820033201170bd17')
