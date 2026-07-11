# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=qtalarm
pkgver=3.0.2
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
a7292c1c4c0200d5ca18078dbe98aa489bd9ebd6293a85cb51ab7e0b266d996c7e9b5fda81c1ded7de5228848c4d53b530c5fa561e5ec7327828a5dccb9d030e
ebe9827d9328cff568c141e7e4977f54d3b510677e9de515af6c446618abd7b76bc93a3d42947de9d38aebe98f9651a1980f1ba045561ee0bce7a10e2cbd99fb
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

