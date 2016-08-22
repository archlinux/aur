# Maintainer: David McInnis <davidm@eagles.ewu.edu
# Contributor: Youngbin Han <sukso96100@gmail.com>
pkgname=micro-nightly-bin
pkgver=20160821
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
  sha256sums=('158c3a2054bed99ef0a0c1af3bcce26d68bce32b1316ac32e61913401232b0fb')
else
  source=('https://github.com/zyedidia/micro/releases/download/nightly/micro-linux32.tar.gz')
  sha256sums=('77a3a69d1781db47cad876e19718dcf0d5a41afcb7a005bb939bf23e7b1e2ca4')
fi

package(){
 install -Dm755 $srcdir/micro/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/micro/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
