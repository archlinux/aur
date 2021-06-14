# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow-bin"
pkgver=3.3.0
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
sha256sums_x86_64=("1cc52b2a4237c48efd80984c48405a3471397288ba80596ccf89f2deda1ae071")
sha256sums_i386=("61718964da1cfdbda65bffca0331c13fb50c11d113be9bec3704429f0f9bf56e")
sha256sums_armv7h=("29130e009e1156ca8e16daac81ec5ae0586ec8ec293432543b82e8204c0ea13d")

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
