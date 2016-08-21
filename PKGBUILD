# Maintainer: David McInnis <davidm@eagles.ewu.edu
# Contributor: Youngbin Han <sukso96100@gmail.com>
pkgname=micro-nightly-bin
pkgver=20160820
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
  sha256sums=('125292d58091c595accf2410bee79f8fdfe5882e445105253210156338f46018')
else
  source=('https://github.com/zyedidia/micro/releases/download/nightly/micro-linux32.tar.gz')
  sha256sums=('f9f2e6a9e33eec4b0a08350c60acf13c76aa4ef392459edf222937d3a26f752d')
fi

package(){
 install -Dm755 $srcdir/micro/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/micro/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
