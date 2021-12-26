# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow-bin"
pkgver=3.4.2
pkgrel=2
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
sha256sums_x86_64=('c2aa25990d8cfb166bc20efa3d9957b38f281bb4aa258c897efe658579058256')
sha256sums_i386=('51f49e44468bbefb47851a22fd724335280945ab031ca113dfa811ba9602b0c0')
sha256sums_armv7h=('17c9e0ceea42f81cf80a83f050b365d193ab41b585d43b0a57466cf4995bd710')
sha256sums_aarch64=('4838e4bbefbbe6ad6fde73cc839aa73593b4864125274331d7d492b314448b41')

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
