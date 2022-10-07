# Maintainer: TheDalaiAlpaca dleeg at tutanota dot com
# Issues: https://gitlab.com/TheDalaiAlpaca/saturnon/-/issues

_pkgname="saturnon"
pkgname="$_pkgname"
pkgver=1.0.1
pkgrel=1
pkgdesc="Treeview based file browser"
arch=('any')
url="https://gitlab.com/TheDalaiAlpaca/saturnon"
license=('GPL3')
depends=('bash>=4.2' 'coreutils' 'ncurses' 'file' 'util-linux' 'grep') 
optdepends=('less: for using saturnon to open textfiles'
            'vlc: for using saturnon with music.conf'
            'dbus: for using saturnon with music.conf')
md5sums=(SKIP)
source=("https://gitlab.com/TheDalaiAlpaca/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz")

package() {
	cd "$_pkgname-$pkgver"
	
	install -Dm755 -t "$pkgdir/usr/bin"            "saturnon"
	install -Dm644 -t "$pkgdir/usr/share/man/man1" "saturnon.1"
	install -Dm644 -t "$pkgdir/etc/saturnon"       "conf/default.conf"
	install -Dm644 -t "$pkgdir/etc/saturnon"       "conf/music.conf"
}
