#Maintainer: affe-ali <affe-ali@web.de>
#Co-Maintainer: Jannik Hauptvogel <jannikhv@gmail.com>
pkgname=gydl-git
pkgver=r76.4b245ea
pkgrel=1
pkgdesc="Gydl (Graphical Youtube-dl) is a GUI wrapper around the already existing youtube-dl program."
arch=('any')
url="https://github.com/JannikHv/gydl"
license=('MIT')
depends=('python' 'gtk3' 'python-gobject' 'youtube-dl')
makedepends=('git')
source=("$pkgname"::"git://github.com/JannikHv/gydl.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $srcdir/$pkgname/src
	install -D gydl $pkgdir/usr/bin/gydl
	cd ../data
	install -D com.github.JannikHv.Gydl.desktop $pkgdir/usr/share/applications/gydl.desktop
	install -D gydl.svg $pkgdir/usr/share/icons/gydl.svg
	install -D ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}