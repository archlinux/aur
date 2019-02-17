# Maintainer: Chris Hobbs (RX14) <chris@rx14.co.uk>

pkgname=nadeshiko
pkgver=2.3.20
pkgrel=1
pkgdesc="A Linux tool to cut short videos with ffmpeg"
arch=('any')
url="https://github.com/deterenkelt/$pkgname"
license=('GPL3')
depends=("bc" "xdg-user-dirs" "ffmpeg" "mediainfo" "perl-file-mimeinfo" "mkvtoolnix-cli" "time"
         "xmlstarlet" "inotify-tools" "lsof" "jq" "socat" "python-gobject")
optdepends=("libnotify: desktop notifications"
            "mpv: nadeshiko-mpv script"
            "gtk3: nadeshiko-mpv script")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/deterenkelt/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b5af41403c8b473b4766d4d2fd483328f23a69db4b53ec2c6840e070374a3093')

prepare() {
    cd $srcdir/Nadeshiko-$pkgver

    sed -i 's/check_for_updates=yes/check_for_updates=no/' exampleconf/example.nadeshiko.rc.sh
}

package() {
    cd $srcdir/Nadeshiko-$pkgver

    make DESTDIR="$pkgdir" PREFIX=/usr
}
