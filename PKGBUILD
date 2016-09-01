# Maintainer: David McInnis <davidm@eagles.ewu.edu
# Contributor: Youngbin Han <sukso96100@gmail.com>
pkgname=micro-nightly-bin
pkgver=20160831
pkgrel=1
_hash="fc2d9bb"
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=(xclip)
conflicts=( "micro-git", "micro" )
provides=("micro")

if [[ $CARCH == 'x86_64' ]]; then
  source=(https://github.com/zyedidia/micro/releases/download/nightly/micro-${_hash}-linux64.tar.gz)
  sha256sums=('cf63768363cf2f03aa55c78dc0e8b6be731b8f655fbfddcfeb1c32712f263b76')
else
  source=(https://github.com/zyedidia/micro/releases/download/nightly/micro-${_hash}-linux32.tar.gz)
  sha256sums=('8805d617726921cc1254b02da1092140f8d0b4713884ba3c6e87e6d155cb7bfe')
fi

package(){
 install -Dm755 $srcdir/micro-${_hash}/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/micro-${_hash}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
