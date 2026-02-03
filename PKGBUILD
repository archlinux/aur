# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow-bin"
pkgver=3.8.6
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
source_aarch64=("http://ftp.de.debian.org/debian/pool/main/x/xsnow/xsnow_$pkgver-1+b1_arm64.deb")
b2sums_x86_64=('f1828f1f54db88b5d00c034ac6a9b65505d035cb1bdc505cdd8e95af712b959a0a28a8356f878deecbcd5550066465633d6bffe82b17d753fb5858800aef2609')
b2sums_aarch64=('314b6e3732dce037c0af89e7c2f95f40bf8e1e7159b80e06f656816b0fcffab67b1b34049fe1be85f115160267d90d5cdea21e1e9b5ba4deba5f37139d3337d3')

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
