# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow-bin"
pkgver=3.7.6
pkgrel=1
pkgdesc="Let it snow on your desktop"
url="https://www.ratrabbit.nl/ratrabbit/xsnow/"
license=("GPL3")
arch=("x86_64" "aarch64")
provides=("xsnow")
conflicts=("xsnow" "xsnow-legacy" "xsnow-comp-patch-git")
depends=("atk" "cairo" "gsl<2.6" "gtk3" "libx11" "libxpm" "libxml2")
source_x86_64=("http://ftp.de.debian.org/debian/pool/main/x/xsnow/xsnow_$pkgver-1_amd64.deb")
source_aarch64=("http://ftp.de.debian.org/debian/pool/main/x/xsnow/xsnow_$pkgver-1_arm64.deb")
b2sums_x86_64=('78dcf2ca2e3fce60f8cd4d5625e67e8dff0e7ce02b770e6d3477c50a7239ab7cc30f0bef4f2b7959f6e3e46c8b2aff9277882c596631939c5da00bd97bbc91d1')
b2sums_aarch64=('e4da5f558cf7383fbd01b100a33e625f47839b0f8a33336257864c9f087d12385874f1ff818a084091cec0720c3b24c5a1aa3e1d97d7650a41f543b2d5a7d471')

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
