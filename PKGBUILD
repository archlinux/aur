# Maintainer: TheDalaiAlpaca dleeg at tutanota dot com
# Issues: https://gitlab.com/TheDalaiAlpaca/saturnon/-/issues

_pkgname="saturnon"
pkgname="$_pkgname"-git
pkgver=0.36.2
pkgrel=1
pkgdesc="Treeview based file browser"
arch=('any')
url="https://gitlab.com/TheDalaiAlpaca/saturnon"
license=('GPL3')
depends=('bash>=4.2' 'coreutils' 'ncurses' 'file' 'util-linux' 'grep') 
optdepends=('less: for using saturnon to open textfiles'
            'vlc: for using saturnon with music.conf'
            'dbus: for using saturnon with music.conf'
            'youtube-dl: for using saturnon with youtube.conf'
            'jq: for using saturnon with youtube.conf'
            'mpv: for using saturnon with youtube.conf')
md5sums=(SKIP)
source=("https://gitlab.com/TheDalaiAlpaca/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz")

package() {
	cd "$_pkgname-$pkgver"

	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/etc/saturnon"
	mkdir -p "$pkgdir/usr/share/saturnon"
	
	install -m 755 -t "$pkgdir/usr/bin"            "saturnon"

	install -m 644 -t "$pkgdir/etc/saturnon"       "conf/default.conf"
	install -m 644 -t "$pkgdir/etc/saturnon"       "conf/music.conf"
	install -m 644 -t "$pkgdir/etc/saturnon"       "conf/youtube.conf"

	install -m 755 -t "$pkgdir/usr/share/saturnon" "scripts/subscribe"
	install -m 755 -t "$pkgdir/usr/share/saturnon" "scripts/refresh"

}
