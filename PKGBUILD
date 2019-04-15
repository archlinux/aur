# Maintainer: Chris Hobbs (RX14) <chris@rx14.co.uk>

pkgname=nadeshiko
pkgver=2.7
pkgrel=1
pkgdesc="A Linux tool to cut short videos with ffmpeg"
arch=('any')
url="https://github.com/deterenkelt/$pkgname"
license=('GPL3')
depends=("bc" "xdg-user-dirs" "ffmpeg" "mediainfo" "perl-file-mimeinfo" "mkvtoolnix-cli" "time" "wget"
         "xmlstarlet" "inotify-tools" "lsof" "jq" "socat" "python-gobject")
optdepends=("libnotify: desktop notifications"
            "mpv: nadeshiko-mpv script"
            "gtk3: nadeshiko-mpv script")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/deterenkelt/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a14ebffcfcf94ec3f23a4dcf2b79a3ee9af57518a69cb16a718efb6d33ffa6cc')

prepare() {
    cd $srcdir/Nadeshiko-$pkgver

    sed -i 's/check_for_updates=yes/check_for_updates=no/' exampleconf/example.nadeshiko.rc.sh
}

package() {
    cd $srcdir/Nadeshiko-$pkgver

    make install DESTDIR="$pkgdir" PREFIX=/usr
}
