# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="xsnow-bin"
pkgver=3.9.6
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
b2sums_x86_64=('0a5d625d9a9457c08281643395fce002245ea39f5e6ff5bca0b54a1662795618ddeea3deaa20ffc7c5c252872eadd5ec59d6f8031764348854300af72723d22a')
b2sums_aarch64=('ef089ec3f80bd6e926d346fe9ad7c19aeea5bbd6e1d69dfa63ec3c7ee5b748025ba626c05dbf59ab1a21ec60fe0e2a65e435b4c05dbd9922f20c22a9aecb6a16')

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
