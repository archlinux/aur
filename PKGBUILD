# Maintainer: TheCyberAcher@protonmail.ch>

pkgname=ultra-flat-icons-blue
pkgver=1.3.2
pkgrel=1
pkgdesc="Ultra Flat Icons - Blue Edition"
arch=('any')
url="http://www.noobslab.com/2015/01/make-linux-more-elegant-with-ultra-flat.html"
license=('CCPL')
optdepends=('gtk-update-icon-cache')
source=("https://launchpad.net/~noobslab/+archive/ubuntu/icons/+files/ultra-flat-icons_$pkgver~trusty~Noobslab.com_all.deb"
        "index.theme.patched")
sha256sums=('f22fbecc41e03f5e20ffc876c2963062486c527cb2729e9576bc40c3fa1e6fd4' 'ba559f7a79a98d0ab27cf7aa475f943f943632aea7d2a8e845936d7a2072ecf5')

package() {

tar -xvf data.tar.xz
rm $srcdir/usr/share/icons/Ultra-Flat/index.theme
rm $srcdir/usr/share/icons/Ultra-Flat/CREDITS
rm $srcdir/usr/share/icons/Ultra-Flat/'fix spotify panel icon'
mv $srcdir/usr/share/icons/Ultra-Flat/status/'scalable white panel' $srcdir/usr/share/icons/Ultra-Flat/status/'scalable_white_panel'
mv $srcdir/usr/share/icons/Ultra-Flat/apps/scalable/'Angry Birds-chrome.angrybirds.com.svg' $srcdir/usr/share/icons/Ultra-Flat/apps/scalable/Angry_Birds-chrome.angrybirds.com.svg
mv $srcdir/usr/share/icons/Ultra-Flat/apps/scalable/'unity-control-center screen.svg' $srcdir/usr/share/icons/Ultra-Flat/apps/scalable/'unity-control-center-screen.svg'
mv $srcdir/usr/share/icons/Ultra-Flat/devices/scalable/' battery.svg' $srcdir/usr/share/icons/Ultra-Flat/devices/scalable/'battery.svg'

local themedir="$pkgdir/usr/share/icons/"
install -d "$themedir"
cp -r "$srcdir/usr/share/icons/Ultra-Flat/" "$themedir/ultra-flat-blue/"
cp "$srcdir/index.theme.patched" "$themedir/ultra-flat-blue/index.theme"
}