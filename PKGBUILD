#Maintainer: affe-ali <affe-ali@web.de>
pkgname=gydl-git
pkgver=r23.77b897c
pkgrel=1
pkgdesc="Gydl (Graphical Youtube-dl) is a GUI wrapper around the already existing youtube-dl program."
arch=('any')
url="https://github.com/JannikHv/gydl"
license=('MIT')
depends=('python' 'gtk3' 'python-gobject')
makedepends=('git')
source=("$pkgname"::"git://github.com/JannikHv/gydl.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $srcdir/$pkgname/src
	install -D gydl.py $pkgdir/usr/bin/gydl
	install -D gydl.desktop $pkgdir/usr/share/applications/gydl.desktop
	install -D ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}