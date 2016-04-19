# Maintainer: Florian Reinhard <f.reinhard42@gmail.com>
pkgname=flashprint
pkgver=3.6.0
pkgrel=1
epoch=
pkgdesc="Slicer for the FlashForge 3D printers."
arch=('x86_64')
url="http://www.ff3dp.com/"
license=()
groups=()
depends=('unrar' 'qt5-base')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.sz3dp.com/upfile/2015/11/19/20151119135106_645.rar")
noextract=()
md5sums=('e34932a16c948857629180ebedb5dc9a')
validpgpkeys=()

prepare() {
    unrar e 20151119135106_645.rar
    tar -xjf flashprint-3.6.0-x86_64.tar.bz2
	cd flashprint-3.6.0-x86_64
}

package() {
	cd flashprint-3.6.0-x86_64

    install -d $pkgdir/usr/share/FlashPrint

    cp -r data $pkgdir/usr/share/FlashPrint
    cp -r doc $pkgdir/usr/share/FlashPrint
    cp -r example $pkgdir/usr/share/FlashPrint
    cp -r engine $pkgdir/usr/share/FlashPrint
    cp -r firmware $pkgdir/usr/share/FlashPrint

    install -m 0755 FlashPrint $pkgdir/usr/share/FlashPrint

    install -d $pkgdir/usr/share/icons/hicolor/64x64/apps
    install -m 0644 resource/flashforge.png $pkgdir/usr/share/icons/hicolor/64x64/apps

    install -d $pkgdir/etc/udev/rules.d
    install -m 0644 resource/99-flashforge.rules $pkgdir/etc/udev/rules.d

    install -d $pkgdir/usr/share/applications
    install -m 0644 resource/FlashPrint.desktop $pkgdir/usr/share/applications
}
