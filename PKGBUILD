# Contributor: Emile Pesik <this.id.was.still.free at gmail dot com>

pkgname=emusicremote
pkgver=1.0.0.3_beta1
pkgrel=2
pkgdesc="Self contained browser + download client for eMusic based on Mozilla's XULRunner."
url="http://emusic.mozdev.org/remote.html"
conflicts=()
provides=()
depends=()
arch=('i686' 'x86_64')
license=('Included')
install=emusicremote.install
source=('emusicremote.desktop' \
"http://downloads.mozdev.org/emusic/remote/emusic_remote_linux_current.tar.gz")
md5sums=('55d7e13ac63c0788ab6e00edb2e4579d'
         '37f7fb46ab65367d3d062dd214a8f5b1')

build() {
    # install application
    mkdir -p $startdir/pkg/usr/share
    cp -Rd $startdir/src/builds/emusicremote $startdir/pkg/usr/share/emusicremote

    # install desktop files
    install -D -m 644 $startdir/pkg/usr/share/emusicremote/xulrunner48.png \
        $startdir/pkg/usr/share/pixmaps/emusicremote.png
    install -D -m 644 $startdir/emusicremote.desktop \
        $startdir/pkg/usr/share/applications/emusicremote.desktop

    # install license files
    install -Dm644 "$srcdir/builds/$pkgname/license.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/license.txt" || return 1
}
