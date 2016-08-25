# Maintainer: David McInnis <davidm@eagles.ewu.edu
# Contributor: Youngbin Han <sukso96100@gmail.com>
pkgname=micro-nightly-bin
pkgver=20160823
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
  sha256sums=('5c33389378b9744456385fd4ca2e2ee4e5dc92efbc6e46eaccbb6d9844a23d80')
else
  source=('https://github.com/zyedidia/micro/releases/download/nightly/micro-linux32.tar.gz')
  sha256sums=('2975b36b18dd5a744e6577dc19252f0f59787cb8466f459f92424d67121a6207')
fi

package(){
 install -Dm755 $srcdir/micro/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/micro/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
