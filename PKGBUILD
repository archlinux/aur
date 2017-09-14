pkgname=desktime
pkgver=1.47
pkgrel=0
pkgdesc="Desktime client for Linux (beta)"
arch=('i686' 'x86_64')
url="http://desktime.com"
license=(custom)
depends=(desktop-file-utils hicolor-icon-theme libappindicator-gtk2 libxss)
install=$pkgname.install

if [[ $CARCH == 'i686' ]]; then
    source=("https://desktime.com/storage/updates/linux/beta/desktime-linux_1.47_i386.deb")
    md5sums=('9dceea027779ae6869199ce8c2bd63a5')
else
    source=("https://desktime.com/storage/updates/linux/beta/desktime-linux_1.47_x64.deb")
    md5sums=('ba5aaf966a204e64789f8c1107f33061')
fi

prepare()
{
    echo
}

package()
{
    cd "$srcdir"
    bsdtar -xf data.tar.xz -C "$srcdir/"

    install -Dm755 "$srcdir/"usr/bin/desktime-linux "$pkgdir/"usr/bin/desktime-linux
    install -Dm644 "$srcdir/"usr/share/applications/desktime.desktop "$pkgdir/"usr/share/applications/desktime.desktop
    install -Dm644 "$srcdir/"usr/share/doc/desktime-linux/changelog.gz "$pkgdir/"usr/share/doc/desktime-linux/changelog.gz
    install -Dm644 "$srcdir/"usr/share/doc/desktime-linux/copyright "$pkgdir/"usr/share/doc/desktime-linux/copyright
    install -Dm644 "$srcdir/"usr/share/icons/desktime.png "$pkgdir/"usr/share/icons/desktime.png

}

# vim:et:sw=4:sts=4
