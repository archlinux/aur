# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow-bin"
pkgver=3.5.2
pkgrel=1
pkgdesc="Let it snow on your desktop"
url="https://sourceforge.net/projects/xsnow/"
license=("GPL3")
arch=("x86_64" "i386" "armv7h" "aarch64")
provides=("xsnow")
conflicts=("xsnow" "xsnow-legacy" "xsnow-comp-patch-git")
depends=("atk" "cairo" "gtk3" "libx11" "libxpm" "libxml2")
source_x86_64=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_amd64.deb")
source_i386=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_i386.deb")
source_armv7h=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_armhf.deb")
source_aarch64=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_arm64.deb")
sha256sums_x86_64=('bfb6cace58c3895bc41375e621710de188611fa0cc2504f14d4e1fc995929608')
sha256sums_i386=('8773236a0f58fe36c3297b352ab63ec289f6d6f78f5235e4e084b8caa5f391e7')
sha256sums_armv7h=('d922e95a95b4de6888cf39437cef16409fc85d83e351d2ca82aaabe0096e58ad')
sha256sums_aarch64=('afbb5f1287ad79e9382bcd9f25c16a56745ab8261d21e4d991c019e797b962b6')

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
