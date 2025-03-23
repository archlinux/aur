# Maintainer: TheCyberArcher@protonmail.ch>

pkgname=ultra-flat-icons-green
pkgver=1.3.2
pkgrel=1
pkgdesc="Ultra Flat Icons - Green Edition"
arch=('any')
url="http://www.noobslab.com/2015/01/make-linux-more-elegant-with-ultra-flat.html"
license=('CCPL')
optdepends=('gtk-update-icon-cache-git')
source=("https://launchpad.net/~noobslab/+archive/ubuntu/icons/+files/ultra-flat-icons-green_$pkgver~trusty~Noobslab.com_all.deb"
        "index.theme.patched")
sha256sums=('6b41d23745926ebc12d4da4f8de24c2865b150ffa5d4b1a0d0c1c7d3e5451c99' '253a088b4e5d53a1694850e86958a2553e75a46d182a48ff62cec504402167ae')

package() {

tar -xvf data.tar.xz
rm $srcdir/usr/share/icons/Ultra-Flat-Green/index.theme
rm $srcdir/usr/share/icons/Ultra-Flat-Green/CREDITS
rm $srcdir/usr/share/icons/Ultra-Flat-Green/'fix spotify panel icon'
rm -rf $srcdir/usr/share/icons/ultra-flat-green/status/scalable_white_panel/'scalable white panel'
mv $srcdir/usr/share/icons/Ultra-Flat-Green/status/'scalable white panel' $srcdir/usr/share/icons/Ultra-Flat-Green/status/'scalable_white_panel'
mv $srcdir/usr/share/icons/Ultra-Flat-Green/apps/scalable/'Angry Birds-chrome.angrybirds.com.svg' $srcdir/usr/share/icons/Ultra-Flat-Green/apps/scalable/Angry_Birds-chrome.angrybirds.com.svg
mv $srcdir/usr/share/icons/Ultra-Flat-Green/apps/scalable/'unity-control-center screen.svg' $srcdir/usr/share/icons/Ultra-Flat-Green/apps/scalable/'unity-control-center-screen.svg'
mv $srcdir/usr/share/icons/Ultra-Flat-Green/devices/scalable/' battery.svg' $srcdir/usr/share/icons/Ultra-Flat-Green/devices/scalable/'battery.svg'


local themedir="$pkgdir/usr/share/icons/"
install -d "$themedir"
cp -r "$srcdir/usr/share/icons/Ultra-Flat-Green/" "$themedir/ultra-flat-green/"
cp "$srcdir/index.theme.patched" "$themedir/ultra-flat-green/index.theme"
}
