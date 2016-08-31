# Maintainer: David McInnis <davidm@eagles.ewu.edu
# Contributor: Youngbin Han <sukso96100@gmail.com>
pkgname=micro-nightly-bin
pkgver=20160830
pkgrel=3
_hash="13da5ce"
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=(xclip)
conflicts=( "micro-git", "micro" )
provides=("micro")

if [[ $CARCH == 'x86_64' ]]; then
  source=(https://github.com/zyedidia/micro/releases/download/nightly/micro-${_hash}-linux64.tar.gz)
  sha256sums=('acdbf21c89682c539a81a3b32cfda11622aeba241f0b025a2517ae84f6481974')
else
  source=(https://github.com/zyedidia/micro/releases/download/nightly/micro-${_hash}-linux32.tar.gz)
  sha256sums=('268a90c44b227b792873065d058b4d20f51faa61d883fe28642fc5ae29b4a0fa')
fi

package(){
 install -Dm755 $srcdir/micro-${_hash}/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/micro-${_hash}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
