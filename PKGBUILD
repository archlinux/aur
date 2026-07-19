# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=qtalarm
pkgver=3.1.0
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
15bd048c582ea744f798900d6d5821e13dc6573f5458e34ad543c26432b494ea7639d56d96deab9dcd01a7ce00f988e911a2a08ff65e16a77ce31790a84e327a
cef17796f0071acc1ce33ba8660abbfd5154261071e8563284ef5c352cc6ed91e012772579df1f01eb144c2d8b2e93f3a4ba890b780a4cece61c5b3839bba3ec
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

