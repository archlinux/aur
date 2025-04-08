# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=qtalarm
pkgver=3.0.0
pkgrel=1
epoch=1
pkgdesc="Cross-platform Alarm Clock written with QT6"
arch=('i686' 'x86_64')
url="https://random-hackery.net/page/qtalarm/"
license=('GPL3')
depends=('qt6-base' 'qt6-multimedia' 'gst-plugins-base' 'gst-plugins-good')
optdepends=('noto-fonts: unicode support for alarm list widget')
makedepends=(make gcc)
source=(
https://random-hackery.net/data/qtalarm/src/QTalarm-$pkgver.tar.gz
https://random-hackery.net/data/qtalarm/src/QTalarm-$pkgver.tar.gz.asc
${pkgname}.desktop
)
validpgpkeys=('914897EC41BD3AED1CD9EC3DE41FF9C889B141CC')
sha512sums=(
2589f812eb0162b8ce173cde93bf566eb4cc3f1b27057b25c10bc83810bc4d83ae19bad998723ec5e2b7a7812680c34c1a141789edbfc449e42f43413c87da93
0e3c112cec0d386edbbca25f1ce01756602a471243841cc1ccacf9323c8d9da29ab70c9cd1e2573fbce4c0ac7d1ea98948817f38982d3b5e2eef095ceb431193
'SKIP'
)

build() {
    cd "${srcdir}/"

    qmake6
    make
    make clean
}

package() {
mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
mkdir -p "$pkgdir/usr/share/icons/hicolor/16x16/apps/"
mkdir -p "$pkgdir/usr/share/icons/hicolor/24x24/apps/"

mkdir "$pkgdir/usr/bin/"
mkdir "$pkgdir/usr/share/applications/"
install -Dm555 Icons/1349069370_Alarm_Clock.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
install -Dm555 Icons/1349069370_Alarm_Clock24.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/1349069370_Alarm_Clock.png"
install -Dm555 Icons/1349069370_Alarm_Clock16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/1349069370_Alarm_Clock.png"
install -Dm555 qtalarm  "$pkgdir/usr/bin/$pkgname"
install -Dm555 "${srcdir}/${pkgname}".desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"

}

