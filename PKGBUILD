# Maintainer: Yoann Ono Dit Biot <yoann.onoditbiot@gmail.com>
pkgname=pydio-sync
pkgver=1.0.4
pkgrel=2
pkgdesc="Pydio synchronisation client"
arch=('i686' 'x86_64')
url="https://pyd.io"
license=('GPL3')
conflicts=('pydio-sync-git' 'pydio-sync-ui-git')
provides=('pydio-sync')
options=(!strip)
depends=('qt5-webkit' 'libsm' 'gstreamer0.10-base')
source=("https://download.pydio.com/pub/pydio-sync/release/$pkgver/PydioSync-Linux-$pkgver.tar.gz"
        "pydio.desktop")
md5sums=('eb3c7bb3d51057dcf1aea0135816263f'
         '24e42bae5d695c42fc7ccc4a30d97583')


package() {
	cd "$srcdir"
	mkdir -p $pkgdir/opt/$pkgname/{pydio-agent,pydio-ui}

	cp $srcdir/pydio-agent/pydio-agent $pkgdir/opt/$pkgname/pydio-agent/
	cp $srcdir/pydio-ui/pydio-ui $pkgdir/opt/$pkgname/pydio-ui/

	
	mkdir -p $pkgdir/usr/share/applications
        install -Dm644 pydio.desktop $pkgdir/usr/share/applications/
        mkdir -p $pkgdir/usr/bin
	ln -s /opt/$pkgname/pydio-ui/pydio-ui $pkgdir/usr/bin/pydio-sync
}
