# Maintainer: Stephanie Hobbs (RX14) <steph@rx14.co.uk>

pkgname=nadeshiko
pkgver=2.15.7
pkgrel=1
pkgdesc="A Linux tool to cut short videos with ffmpeg"
arch=('any')
url="https://github.com/deterenkelt/$pkgname"
license=('GPL3')
depends=("bc" "xdg-user-dirs" "ffmpeg" "mediainfo" "perl-file-mimeinfo" "mkvtoolnix-cli" "time" "wget"
         "xmlstarlet" "inotify-tools" "lsof" "jq" "socat" "python-gobject" "file")
optdepends=("libnotify: desktop notifications"
            "mpv: nadeshiko-mpv script"
            "gtk3: nadeshiko-mpv script"
            "parallel: speed up some operations by runninf in parallel")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/deterenkelt/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('726002dec2f20714aadd2f460e5946aaa129ca36d9f9ba7691a6e1d3262cbb23')

prepare() {
    cd $srcdir/Nadeshiko-$pkgver

    sed -i 's/check_for_updates=yes/check_for_updates=no/' defconf/nadeshiko.10_main.rc.sh
}

package() {
    cd $srcdir/Nadeshiko-$pkgver

    make install DESTDIR="$pkgdir" PREFIX=/usr
}
