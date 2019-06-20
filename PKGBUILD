# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Steve Skydev <steve@skycoin.net>
pkgname=skyflash-bin
pkgname1=skyflash
projectname=skycoin
pkgdesc="Skywire Node microSD / TFcard setup utility. skycoin.net"
pkgver=0.0.4beta
pkggopath="github.com/$projectname/$pkgname1"
pkgrel=1
arch=('any')
url="https://${pkggopath}"
license=()
makedepends=(gzip)
depends=()
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC')
source=("https://github.com/skycoin/skyflash/releases/download/Skyflash-v0.0.4-beta1-Linux/skyflash-gui_linux64-static.gz")
sha256sums=('f3b918e9ad9d1ff3a02dd6f25b942a4a66e37c77163b25829ae4a648f44fd833')

prepare() {
rm -rf $srcdir/skyflash-gui_linux64-static.gz
cd ..
gunzip -k skyflash-gui_linux64-static.gz
mv skyflash-gui_linux64-static $srcdir/skyflash-gui
}

package() {
msg2 'installing files'
install -Dm755 $srcdir/skyflash-gui $pkgdir/usr/lib/$projectname/go/bin/skyflash-gui
mkdir -p $pkgdir/usr/bin
ln -rTsf $pkgdir/usr/lib/$projectname/go/bin/skyflash-gui $pkgdir/usr/bin/skyflash-gui
chmod 755 $pkgdir/usr/bin/skyflash-gui
}
