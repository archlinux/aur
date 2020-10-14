# Submitter: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Maintainer: Zren <zrenfire@gmail.com>

pkgname=plasma5-applets-eventcalendar
pkgver=70
pkgrel=1
pkgdesc="An extended calendar plasmoid with daily weather forecasts and events from Google Calendar. Also includes a timer and 24 hour forecast graph."
arch=('any')
url="https://store.kde.org/p/998901/"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('bash' 'gettext')
source=("https://github.com/Zren/plasma-applet-eventcalendar/archive/v$pkgver.tar.gz")
md5sums=('7f781c67da6ab7b9a3d6bc8e7d59ca0f')

package() {
    cd plasma-applet-eventcalendar-$pkgver/package

    mkdir -p $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.eventcalendar
    cp -r * $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.eventcalendar

    cd $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.eventcalendar/translate
    sh ./build
    mkdir -p $pkgdir/usr/share/locale
    mv $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.eventcalendar/contents/locale $pkgdir/usr/share/
    rm -rf $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.eventcalendar/translate
}

