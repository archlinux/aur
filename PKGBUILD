pkgname=desktime
pkgver=1.38
pkgrel=1
pkgdesc="Desktime client for Linux (beta)"
arch=('i686' 'x86_64')
url="http://desktime.com"
license=(custom)
depends=(desktop-file-utils hicolor-icon-theme libappindicator-gtk2 libxss)
install=$pkgname.install

if [[ $CARCH == 'i686' ]]; then
    source=("http://desktime.com/updates/linux/beta/desktime-linux_$pkgver_i386.deb")
    md5sums=('467340ff81e6c1d12351715c7cafc1ae')
else
    source=("http://desktime.com/updates/linux/beta/desktime-linux_1.38_x64.deb")
    md5sums=('72600c449bddb225cda5deb2867505a0')
fi

prepare()
{
    echo
}

package()
{
    cd "$srcdir"
    bsdtar -xf data.tar.xz -C "$srcdir/"
    #install -d "$pkgdir/"usr/bin
    #install -d "$pkgdir/"usr/share/applications
    #install -d "$pkgdir/"usr/share/doc/desktime-linux
    #install -d "$pkgdir/"usr/share/icons

    install -Dm755 "$srcdir/"usr/bin/desktime-linux "$pkgdir/"usr/bin/desktime-linux
    install -Dm644 "$srcdir/"usr/share/applications/desktime.desktop "$pkgdir/"usr/share/applications/desktime.desktop
    install -Dm644 "$srcdir/"usr/share/doc/desktime-linux/changelog.gz "$pkgdir/"usr/share/doc/desktime-linux/changelog.gz
    install -Dm644 "$srcdir/"usr/share/doc/desktime-linux/copyright "$pkgdir/"usr/share/doc/desktime-linux/copyright
    install -Dm644 "$srcdir/"usr/share/icons/desktime.png "$pkgdir/"usr/share/icons/desktime.png

}

# vim:et:sw=4:sts=4
