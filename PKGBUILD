# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=qtalarm
pkgver=3.0.1
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
d706185a35f90c82f7e7a02174b633318fa88a9c19b2d22b1dfd42ef4a0fd5e4234e72a2ec27de79bccefafe5409fdb9fcb96e68bc0d406978b1355450158c4a
cfd9a3ec5c22a47461abf9290a632f7c4dc07700444ea18c49e62fcc5209fde29fb8787c40efa00c6447c2e9fe1854c67d6bd211009566dedc9bc1820fd66df7
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

