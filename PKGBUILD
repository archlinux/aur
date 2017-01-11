pkgname=icqdesktop
pkgver=10.0.3055
pkgrel=1
pkgdesc="Official ICQ client for Linux. Binary version."
arch=("i686" "x86_64")
url="https://icq.com/linux/"
license=("APLv2")
depends=("qt5-base")
source=("https://r.mail.ru/clo20842175/storage.icq.com/pub/ICQ_Linux/x64/icq.tar.xz")
sha256sums=("da30a70e9a34ced8ef4b0e7f95624340a03d3c39d99dba4ac704681bebe384a1")
if [ "`uname -m`" = "i686" ]; then
    source=("https://r.mail.ru/clo20842173/storage.icq.com/pub/ICQ_Linux/x32/icq.tar.xz")
    sha256sums=("f217c97d958d01bc73e4d6177c3fc9ddb2dfb59a5bc584694e645bfa3baf080b")
fi
source+=("https://raw.githubusercontent.com/mailru/icqdesktop/master/gui/resources/main_window/appicon.ico" "icq.desktop")
sha256sums+=("8b304d3f11ee73aa288c61aba47c853d83a080286e60afdcbcca9cccba62c54c" "6c8d6e9481f5978038fc2bbd91c41bc831bebc3df87e9117d9571f39f1305c43")

package () {
    cd $srcdir
    install -D -m 755 icq $pkgdir/usr/bin/icq
    install -D -m 644 appicon.ico $pkgdir/usr/share/pixmaps/icq.ico
    install -D -m 644 icq.desktop $pkgdir/usr/share/applications/icq.desktop
}

