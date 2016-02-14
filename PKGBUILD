# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=qtalarm
pkgver=4700237.9
pkgrel=1
pkgdesc="Cross-platform Alarm Clock written with QT5"
arch=('i686' 'x86_64')
url="http://random-hackery.net/"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia')
makedepends=(make gcc)
source=(
https://random-hackery.net/qtalarm_source/QTalarm-1.9.tar.gz
)
md5sums=(
13ef4cafbd6323993c16b556e6771992
)

build() {
    cd "${srcdir}/QTalarm-1.9/"

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
install -Dm555 QTalarm-1.9/Icons/1349069370_Alarm_Clock.png $pkgdir/usr/share/icons/hicolor/48x48/apps/
install -Dm555 QTalarm-1.9/Icons/1349069370_Alarm_Clock24.png $pkgdir/usr/share/icons/hicolor/24x24/apps/1349069370_Alarm_Clock.png
install -Dm555 QTalarm-1.9/Icons/1349069370_Alarm_Clock16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/1349069370_Alarm_Clock.png
install -Dm555 QTalarm-1.9/QTalarm  "$pkgdir/usr/bin/$pkgname"
install -Dm555 "../${pkgname}".desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"

}

