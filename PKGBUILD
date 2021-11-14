# Maintainer Vincent Schweiger <vincent.schweiger@xolley.de>

pkgname=legendary-zsh
pkgver=1.0
pkgrel=1
pkgdesc="Personal ZSH configuration"
url="https://github.com/legendary-cookie/legendary-zsh"
license=('GPL')
install=legendary.install
source=(
    "https://github.com/legendary-cookie/$pkgname/archive/refs/tags/$pkgver.tar.gz"
    "aurmode.patch"
)
arch=('any')
sha256sums=('1d096bb39e67fd83c4bbef829a2ac872f76a1f56b563efff671c0445980e676d'
            '49028d3d49c0cbe9a9b20f9d1a8ac3c78fb97946d00b39f135ded44cdb3dbe51')
depends=(
	zsh git
)

prepare() {
	patch $srcdir/$pkgname-$pkgver/install.sh $srcdir/aurmode.patch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  for f in $(find .)
  do
  	cp -r $f "$pkgdir/usr/share/$pkgname/$f"
  done
}

#vim: syntax=sh
