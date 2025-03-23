# Maintainer: TheCyberArcher@protonmail.ch>

pkgname=ultra-flat-icons-orange
pkgver=1.3.2
pkgrel=1
pkgdesc="Ultra Flat Icons - Orange Edition"
arch=('any')
url="http://www.noobslab.com/2015/01/make-linux-more-elegant-with-ultra-flat.html"
license=('CCPL')
optdepends=('gtk-update-icon-cache')
source=("https://launchpad.net/~noobslab/+archive/ubuntu/icons/+files/ultra-flat-icons-orange_$pkgver~trusty~Noobslab.com_all.deb"
        "index.theme.patched")
sha256sums=('97e0ea1b8d9389a821293e6546f754cd585bf02717a90ba56d7518901499e93c' '7968e509d71e162c161c44aed5ca5816c643a3ad6a0735d2543b1eb39e1353c6')

package() {
tar -xvf data.tar.xz
rm $srcdir/usr/share/icons/Ultra-Flat-Orange/index.theme
rm $srcdir/usr/share/icons/Ultra-Flat-Orange/CREDITS
rm $srcdir/usr/share/icons/Ultra-Flat-Orange/'fix spotify panel icon'
rm -rf $srcdir/usr/share/icons/Ultra-Flat-Orange/status/scalable_white_panel/'scalable white panel'
mv $srcdir/usr/share/icons/Ultra-Flat-Orange/status/'scalable white panel' $srcdir/usr/share/icons/Ultra-Flat-Orange/status/'scalable_white_panel'
mv $srcdir/usr/share/icons/Ultra-Flat-Orange/apps/scalable/'Angry Birds-chrome.angrybirds.com.svg' $srcdir/usr/share/icons/Ultra-Flat-Orange/apps/scalable/Angry_Birds-chrome.angrybirds.com.svg
mv $srcdir/usr/share/icons/Ultra-Flat-Orange/apps/scalable/'unity-control-center screen.svg' $srcdir/usr/share/icons/Ultra-Flat-Orange/apps/scalable/'unity-control-center-screen.svg'
mv $srcdir/usr/share/icons/Ultra-Flat-Orange/devices/scalable/' battery.svg' $srcdir/usr/share/icons/Ultra-Flat-Orange/devices/scalable/'battery.svg'


local themedir="$pkgdir/usr/share/icons/"
install -d "$themedir"
cp -r "$srcdir/usr/share/icons/Ultra-Flat-Orange//" "$themedir/ultra-flat-orange/"
cp "$srcdir/index.theme.patched" "$themedir/ultra-flat-orange/index.theme"
}
