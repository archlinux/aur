# Maintainer: David McInnis <davidm@eagles.ewu.edu
# Contributor: Youngbin Han <sukso96100@gmail.com>
pkgname=micro-nightly-bin
pkgver=20160828
pkgrel=3
_hash="da98a2e"
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=(xclip)
conflicts=( "micro-git", "micro" )
provides=("micro")

if [[ $CARCH == 'x86_64' ]]; then
  source=(https://github.com/zyedidia/micro/releases/download/nightly/micro-${_hash}-linux64.tar.gz)
  sha256sums=('86c780778555829a956ca03332b0f09fcafb12d21a25b15e2aea9bf030a25164')
else
  source=(https://github.com/zyedidia/micro/releases/download/nightly/micro-${_hash}-linux32.tar.gz)
  sha256sums=('0401d73dc1e0094a1812764bbda96fc230fcfa2d683f930d69c393183f175d95')
fi

package(){
 install -Dm755 $srcdir/micro-${_hash}/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/micro-${_hash}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
