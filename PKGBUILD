# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=qtalarm
pkgver=2.5.1
pkgrel=2
epoch=1
pkgdesc="Cross-platform Alarm Clock written with QT5"
arch=('i686' 'x86_64')
url="https://random-hackery.net/page/qtalarm/"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'gst-plugins-base' 'gst-plugins-good')
optdepends=('noto-fonts: unicode support for alarm list widget')
makedepends=(make gcc)
source=(
https://random-hackery.net/data/qtalarm/src/QTalarm-2.5.1.tar.gz
https://random-hackery.net/data/qtalarm/src/QTalarm-2.5.1.tar.gz.asc
)
validpgpkeys=('914897EC41BD3AED1CD9EC3DE41FF9C889B141CC')
md5sums=(
71d911196400de49aba0362c8513fa7b
e5aa166a80d79e56ecaf19c78fb8f0c6
)

build() {
    cd "${srcdir}/"

    qmake
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
install -Dm555 "${BUILDDIR}/${pkgname}".desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"

}

