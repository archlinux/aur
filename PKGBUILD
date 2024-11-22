# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow-bin"
pkgver=3.7.8
pkgrel=2
pkgdesc="Let it snow on your desktop"
url="https://www.ratrabbit.nl/ratrabbit/xsnow/"
license=("GPL3")
arch=("x86_64" "aarch64")
provides=("xsnow")
conflicts=("xsnow" "xsnow-legacy" "xsnow-comp-patch-git")
depends=("atk" "cairo" "gsl" "gtk3" "libx11" "libxpm" "libxml2")
# replaced sourceforce with results from https://pkgs.org/search/?q=xsnow
source_x86_64=("http://ftp.de.debian.org/debian/pool/main/x/xsnow/xsnow_$pkgver-1+b2_amd64.deb")
source_aarch64=("http://ftp.de.debian.org/debian/pool/main/x/xsnow/xsnow_$pkgver-1+b2_arm64.deb")
b2sums_x86_64=('26ce253b19c08e7ce390e51e72320ff19394ab4f60ad620f40b9bdc173cea5295ca7631608e22ee3b8562ba36b84e0de26272f904229a414c515379d1d5c9929')
b2sums_aarch64=('3260c02191a3b47025172dbee0703c31fd78f89ed3bae80601addf5ad0bc3a3e5d93a53c6997b3589da8abd51e4be19ca478dc807e2cc0f770d2397f4b3daa22')

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
