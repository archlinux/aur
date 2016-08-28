# Maintainer: David McInnis <davidm@eagles.ewu.edu
# Contributor: Youngbin Han <sukso96100@gmail.com>
pkgname=micro-nightly-bin
pkgver=20160828
pkgrel=2
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=(xclip)
conflicts=( "micro-git", "micro" )
provides=("micro")

if [[ $CARCH == 'x86_64' ]]; then
  source=('https://github.com/zyedidia/micro/releases/download/nightly/micro-2de42bc-linux64.tar.gz')
  sha256sums=('41d1344c8c0fc1d86eeb5c2eb5d389e035a77e292b50a47db8a0eb5755d045f5')
else
  source=('https://github.com/zyedidia/micro/releases/download/nightly/micro-2de42bc-linux32.tar.gz')
  sha256sums=('eb1494fdcff783065e8908b8104a24103c7afb7506bd666212ea3d679b94fd26')
fi

package(){
 install -Dm755 $srcdir/micro-2de42bc/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/micro-2de42bc/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
