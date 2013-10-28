# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Maintainer: Xyne <ac xunilhcra enyx, backwards>

pkgname=lxsplit
pkgver=0.2.4
pkgrel=3
pkgdesc="Command-line file splitter/joiner compatible with any HJSplit version"
arch=('i686' 'x86_64')
url="http://lxsplit.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/sourceforge/lxsplit/lxsplit-${pkgver}.tar.gz")
sha256sums=('858fa939803b2eba97ccc5ec57011c4f4b613ff299abbdc51e2f921016845056')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  make INSTALL_PATH="$pkgdir/usr/bin" install
}
