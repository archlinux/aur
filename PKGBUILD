# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow-bin"
pkgver=3.7.4
pkgrel=1
pkgdesc="Let it snow on your desktop"
url="https://www.ratrabbit.nl/ratrabbit/xsnow/"
license=("GPL3")
arch=("x86_64" "i386" "armv7h" "aarch64")
provides=("xsnow")
conflicts=("xsnow" "xsnow-legacy" "xsnow-comp-patch-git")
depends=("atk" "cairo" "gsl<2.6" "gtk3" "libx11" "libxpm" "libxml2")
source_x86_64=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_amd64.deb")
source_i386=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_i386.deb")
source_armv7h=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_armhf.deb")
source_aarch64=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_arm64.deb")
sha256sums_x86_64=('63c15da4c5edc7c760b71edabd86ca2f79ca4f12547d5bd41739a7196839f3a7')
sha256sums_i386=('1f62912569d2f777cf601a07246c187ddd47cb9c2f72fc3de990d2f08c8f2b9d')
sha256sums_armv7h=('11cc08b9540f24549707c320f0b7c496428ec4677cb42736267cc48bfc4ba530')
sha256sums_aarch64=('525ed9679e3b7e351320b389b0ab6ed66319e1f01cc4dfd11c3bf330cf01cbbc')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 install -d 755 "usr/bin"
 install -d 755 "usr/share/doc/licenses/xsnow"
 mv "usr/games/xsnow" "usr/bin"
 rm -r "usr/games"
 gunzip -f "usr/share/doc/xsnow/changelog.gz"
 rm "usr/share/doc/xsnow/changelog.Debian.gz"
 mv "usr/share/doc/xsnow/copyright" "usr/share/doc/licenses/xsnow/LICENSE"
 cp -r "usr" "$pkgdir"
}
