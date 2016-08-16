# Maintainer: David McInnis <davidm@eagles.ewu.edu
# Contributor: Youngbin Han <sukso96100@gmail.com>
pkgname=micro-nightly-bin
pkgver=20160814
pkgrel=1
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=(xclip)
conflicts=( "micro-git", "micro" )
provides=("micro")

if [[ $CARCH == 'x86_64' ]]; then
  source=('https://github.com/zyedidia/micro/releases/download/nightly/micro-linux64.tar.gz')
  sha256sums=('19b25a8d2ef30a3f6352bf387ef9d073c2d90a22bcdabad853ffec7e60beb3d8')
else
  source=('https://github.com/zyedidia/micro/releases/download/nightly/micro-linux32.tar.gz')
  sha256sums=('db904c2628d0cf4098ad9d691ee6be519e93df961202ab2aef56306ae754ff0a')
fi

package(){
 install -Dm755 $srcdir/micro/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/micro/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
