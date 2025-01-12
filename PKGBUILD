# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow-bin"
pkgver=3.8.3
pkgrel=1
pkgdesc="Let it snow on your desktop"
url="https://www.ratrabbit.nl/ratrabbit/xsnow/"
license=("GPL3")
arch=("x86_64" "aarch64")
provides=("xsnow")
conflicts=("xsnow" "xsnow-legacy" "xsnow-comp-patch-git")
depends=("atk" "cairo" "gsl" "gtk3" "libx11" "libxpm" "libxml2")
# replaced sourceforce with results from https://pkgs.org/search/?q=xsnow
source_x86_64=("http://ftp.de.debian.org/debian/pool/main/x/xsnow/xsnow_${pkgver}-1_amd64.deb")
source_aarch64=("http://ftp.de.debian.org/debian/pool/main/x/xsnow/xsnow_${pkgver}-1_arm64.deb")
b2sums_x86_64=('323b4d70f439bb2808700304aacded3dba88894a81c8c7da82527f67950f6005107216f34e8b694a51866c89445b72eedeefa7208822ef9fe33281278074221f')
b2sums_aarch64=('6a02b5e40022dca9e64766739a2329feeb0778b66159b524105531bd7936cde339a3937f3a3fbf63e6404eeac797a71b75664601daccde622fca525a3727fa33')

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
