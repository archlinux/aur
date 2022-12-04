# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow-bin"
pkgver=3.6.0
pkgrel=1
pkgdesc="Let it snow on your desktop"
url="https://www.ratrabbit.nl/ratrabbit/xsnow/"
license=("GPL3")
arch=("x86_64" "i386" "armv7h" "aarch64")
provides=("xsnow")
conflicts=("xsnow" "xsnow-legacy" "xsnow-comp-patch-git")
depends=("atk" "cairo" "gtk3" "libx11" "libxpm" "libxml2")
source_x86_64=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_amd64.deb")
source_i386=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_i386.deb")
source_armv7h=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_armhf.deb")
source_aarch64=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_arm64.deb")
sha256sums_x86_64=('6c2867e9853ee83da470f71071659a81217c2d6548508d0711a59c915713d686')
sha256sums_i386=('f8d4a2ef4fbaafa4cdfc1b8edf6599952ac1d7e0b48616d9d0678089bcf50ab4')
sha256sums_armv7h=('4e59ff69a18a65ccb9e051ca5e096644d26d4c696c821eeb989dc78876fd3270')
sha256sums_aarch64=('a47aee70709fe22675712caa51cd356965be6bf531b64f8ebb8c85320718ad88')

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
