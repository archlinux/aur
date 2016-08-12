# Maintainer: David McInnis <davidm@eagles.ewu.edu
# Contributor: Youngbin Han <sukso96100@gmail.com>
pkgname=micro-nightly-bin
pkgver=20160811
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
  sha256sums=('669460514a1353380321b7ed9c6d92a66e6fe9a3080872757bf6ca7ed09d1310')
else
  source=('https://github.com/zyedidia/micro/releases/download/nightly/micro-linux32.tar.gz')
  sha256sums=('2c7395811ab39c3ea914aa3924f66cd2eef60b6310a702f0bb029d335ee6a91a')
fi

package(){
 install -Dm755 $srcdir/micro/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/micro/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
