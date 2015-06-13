# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: KillaB <xGenoBlast@gmail.com>

pkgname=frozendepths
pkgver=1.05
_ver=105
pkgrel=1
pkgdesc="A roguelike game with a cold theme."
arch=("i686" "x86_64")
url="http://frozendepths.net/"
license=("closed")
depends=("ncurses")
depends_x86_64=("lib32-ncurses")
source=("http://frozendepths.net/FD${_ver}Lin.tar.gz"
        "frozendepths")
md5sums=('271e21559a9e267e9cc13bfa307b3127'
         '44b0e3ab55d1b9e94930870540fcc69c')

# todo: ARM binary
# http://frozendepths.net/FD${_ver}ARM.tar.gz

package() {
	cd "$srcdir/FD${_ver}Lin"
	install -Dm4755 "fdepths" "$pkgdir/usr/share/frozendepths/fdepths"
	install -m644 *.txt *.fds "$pkgdir/usr/share/frozendepths"

	install -Dm755 "$srcdir/frozendepths" "$pkgdir/usr/bin/frozendepths"
}
