# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=qtalarm
pkgver=4700237.9.1
pkgrel=1
pkgdesc="Cross-platform Alarm Clock written with QT5"
arch=('i686' 'x86_64')
url="http://random-hackery.net/"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'gst-plugins-base' 'gst-plugins-good')
makedepends=(make gcc)
source=(
https://random-hackery.net/qtalarm_source/QTalarm-1.9.1.tar.gz
)
md5sums=(
708d01ecd65b4680ac5389756a366103
)

build() {
    cd "${srcdir}/"

    qmake
    make
    make clean
}

package() {
mkdir $pkgdir/usr/
mkdir $pkgdir/usr/share/
mkdir $pkgdir/usr/share/icons/
mkdir $pkgdir/usr/share/icons/hicolor/
mkdir $pkgdir/usr/share/icons/hicolor/48x48
mkdir $pkgdir/usr/share/icons/hicolor/16x16
mkdir $pkgdir/usr/share/icons/hicolor/24x24
mkdir $pkgdir/usr/share/icons/hicolor/48x48/apps/
mkdir $pkgdir/usr/share/icons/hicolor/16x16/apps/
mkdir $pkgdir/usr/share/icons/hicolor/24x24/apps/

mkdir $pkgdir/usr/bin/
mkdir $pkgdir/usr/share/applications/
install -Dm555 Icons/1349069370_Alarm_Clock.png $pkgdir/usr/share/icons/hicolor/48x48/apps/
install -Dm555 Icons/1349069370_Alarm_Clock24.png $pkgdir/usr/share/icons/hicolor/24x24/apps/1349069370_Alarm_Clock.png
install -Dm555 Icons/1349069370_Alarm_Clock16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/1349069370_Alarm_Clock.png
install -Dm555 QTalarm  "$pkgdir/usr/bin/$pkgname"
install -Dm555 "../${pkgname}".desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"

}

