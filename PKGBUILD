# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow-bin"
pkgver=3.4.1
pkgrel=2
pkgdesc="Let it snow on your desktop"
url="https://sourceforge.net/projects/xsnow/"
license=("GPL3")
arch=("x86_64" "i386" "armv7h" "aarch64")
provides=("xsnow")
conflicts=("xsnow")
depends=("atk" "cairo" "gtk3" "libx11" "libxpm" "libxml2")
source_x86_64=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_amd64.deb")
source_i386=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_i386.deb")
source_armv7h=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_armhf.deb")
source_aarch64=("https://master.dl.sourceforge.net/project/xsnow/xsnow_$pkgver-1_arm64.deb")
sha256sums_x86_64=('0dea5a116d91097752ea2b6c4c62d128b19a993f25371af494f8f7e64d7a6a63')
sha256sums_i386=('133966055aac7a971e6019e1a7460224c86747db0e80385afe92d883f505d677')
sha256sums_armv7h=('95a8acd9a68a7a29a3a905cadab8dcc4bc0460e86cd620ce98a1564801851441')
sha256sums_aarch64=('92d7e4cdecf43a46e269890e37ef05301be891aa5ad673610b5afc3ce5dc5be5')

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
