pkgname=icqdesktop
pkgver=10.0.3010
pkgrel=1
pkgdesc="Official ICQ client for Linux. Binary version."
arch=("i686" "x86_64")
url="https://icq.com/linux/"
license=("APLv2")
depends=("qt5-base")
source=("https://r.mail.ru/clb20842175/storage.icq.com/pub/ICQ_Linux/x64/icq")
sha256sums=("686ead7d6a1bd15d7cb4b0b6d9654d112061fdd74d3ea8e38a85df28c2ad62f5")
if [ "`uname -m`" = "i686" ]; then
    source=("https://r.mail.ru/clb20842173/storage.icq.com/pub/ICQ_Linux/x32/icq")
    sha256sums=("6e28b5adc0a64f45518beb32ebb87a41464c59cfd0e7fdb7d1b359d59884409a")
fi
source+=("https://raw.githubusercontent.com/mailru/icqdesktop/master/gui/resources/main_window/appicon.ico" "icq.desktop")
sha256sums+=("8b304d3f11ee73aa288c61aba47c853d83a080286e60afdcbcca9cccba62c54c" "6c8d6e9481f5978038fc2bbd91c41bc831bebc3df87e9117d9571f39f1305c43")

package () {
    cd $srcdir
    install -D -m 755 icq $pkgdir/usr/bin/icq
    install -D -m 644 appicon.ico $pkgdir/usr/share/pixmaps/icq.ico
    install -D -m 644 icq.desktop $pkgdir/usr/share/applications/icq.desktop
}

