# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow-bin"
pkgver=3.9.10
pkgrel=1
pkgdesc="Let it snow on your desktop"
url="https://www.ratrabbit.nl/ratrabbit/xsnow/"
license=("GPL3")
arch=("x86_64" "aarch64")
provides=("xsnow")
conflicts=("xsnow" "xsnow-legacy" "xsnow-comp-patch-git")
depends=("atk" "cairo" "gsl" "gtk3" "libx11" "libxpm" "libxml2")
# replaced sourceforce with results from https://pkgs.org/search/?q=xsnow
source_x86_64=("http://ftp.de.debian.org/debian/pool/main/x/xsnow/xsnow_$pkgver-1_amd64.deb")
source_aarch64=("http://ftp.de.debian.org/debian/pool/main/x/xsnow/xsnow_$pkgver-1_arm64.deb")
b2sums_x86_64=('99a20ee1837af978fb46f73cd4e15fe7d368d50bb01670f81819f8fb00e665341f94c7fa892c4c2201e70857eec6d9653957f44ce0b91768171a80b243993647')
b2sums_aarch64=('9c3cf1f40a6ba55f736b6716b0e9ba7cbaecbe7b6f467a3e544322624fd3415931515cec6caf7d5fd715cff17786a5382823ca39d48a7f7c6bb38097cafcac73')

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
