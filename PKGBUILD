# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow-bin"
pkgver=3.1.7
pkgrel=1
pkgdesc="Let it snow on your desktop"
url="https://sourceforge.net/projects/xsnow/"
license=("GPL3")
arch=("x86_64" "i386" "armv7h")
provides=("xsnow")
conflicts=("xsnow")
depends=("atk" "cairo" "gtk3" "libx11" "libxpm" "libxml2")
source_x86_64=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_amd64.deb")
source_i386=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_i386.deb")
source_armv7h=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_armhf.deb")
sha256sums_x86_64=("6b45155ff4bf9a8091b05340b35212db2ab73964b8dbbb21f8834a501f9645fc")
sha256sums_i386=("337d687216a493ffe21f0611f873f22cf801e8b7275eff0d86938082f5b701d0")
sha256sums_armv7h=("1c2c692e4411cda71631a25bf1328a849f191353b5fb6578d77046e0890ec2e4")

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
