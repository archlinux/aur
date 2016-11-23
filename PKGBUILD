pkgname=desktime
pkgver=1.41
pkgrel=1
pkgdesc="Desktime client for Linux (beta)"
arch=('i686' 'x86_64')
url="http://desktime.com"
license=(custom)
depends=(desktop-file-utils hicolor-icon-theme libappindicator-gtk2 libxss)
install=$pkgname.install

if [[ $CARCH == 'i686' ]]; then
    source=("https://new.desktime.com/updates/linux/update/beta?i386")
    md5sums=('09348406e0f9bb6d128a562cff30685b')
else
    source=("https://new.desktime.com/updates/linux/update/beta?x64")
    md5sums=('3c444318b85b41d17957e92c96d1ecbd')
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
