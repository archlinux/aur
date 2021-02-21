# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow-bin"
pkgver=3.2.2
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
sha256sums_x86_64=("583ccc7ff136181ba715a009f349b109adc56cf41af4f28ebf8264c51cc8943e")
sha256sums_i386=("f058d66dfb551222e1b28b9f4c38e7c1d05894f5cc773b71b3b529c46782c513")
sha256sums_armv7h=("034208cf0059070b7ffdb402ef2a12e4b86ae5b09ae2287292b4e5b939041b1c")

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
