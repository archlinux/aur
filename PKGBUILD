# Maintainer: Yoann Ono Dit Biot <yoann.onoditbiot@gmail.com>
pkgname=pydio-sync
pkgver=1.0.2
pkgrel=1
pkgdesc="Pydio synchronisation client"
arch=('i686' 'x86_64')
url="https://pyd.io"
license=('GPL3')
conflicts=('pydio-sync-git' 'pydio-sync-ui-git')
provides=('pydio-sync')
options=(!strip)
source=("https://pyd.io/resources/pydio6/data/public/pydiosync-linux-1-0-2-targz?dl=true&file=/1e481dfadf/PydioSync-Linux-v$pkgver.tar.gz"
        "pydio.desktop")
md5sums=('501bc58a8b08345e9e2acf5bc5474680'
         '24e42bae5d695c42fc7ccc4a30d97583')


package() {
	cd "$srcdir"
	mkdir -p $pkgdir/opt/$pkgname

	cp -R $srcdir/pydio-* $pkgdir/opt/$pkgname
	
	mkdir -p $pkgdir/usr/share/applications
        install -Dm644 $startdir/pydio.desktop $pkgdir/usr/share/applications/
        mkdir -p $pkgdir/usr/bin
	ln -s /opt/$pkgname/pydio-ui/pydio-ui $pkgdir/usr/bin/pydio-sync
}
