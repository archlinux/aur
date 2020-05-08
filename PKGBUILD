# Maintainer: TheDalaiAlpaca dleeg@tutanota.com
# Issues: https://gitlab.com/TheDalaiAlpaca/saturnon/-/issues

_pkgname="saturnon"
pkgname="$_pkgname"-git
pkgver=0.29.1
pkgrel=1
pkgdesc="Treeview based file browser"
arch=('any')
url="https://gitlab.com/TheDalaiAlpaca/saturnon"
license=('GPL3')
depends=('bash>=4.2' 'coreutils' 'ncurses' 'file' 'util-linux') 
optdepends=('less: for using saturnon to open textfiles'
            'vlc: for using saturnon to play audio')
md5sums=(SKIP)
source=("https://gitlab.com/TheDalaiAlpaca/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz")

package() {
	cd "$_pkgname-$pkgver"

	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/etc/saturnon/examples"
	
	install -m 755 -t "$pkgdir/usr/bin"               "saturnon"
	install -m 644 -t "$pkgdir/etc/saturnon"          "conf/default.conf"
	install -m 644 -t "$pkgdir/etc/saturnon/examples" "conf/music.conf"
}
