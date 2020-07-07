# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Maintainer: Xyne <ac xunilhcra enyx, backwards>

pkgname=lxsplit
pkgver=0.2.4
pkgrel=5
pkgdesc="Command-line file splitter/joiner compatible with any HJSplit version"
arch=('x86_64')
url="http://lxsplit.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=("https://downloads.sourceforge.net/sourceforge/lxsplit/lxsplit-${pkgver}.tar.gz")
sha512sums=('2483010752177232801029b969a01a2702830c47e5d6a185784d9d945b792aecb778241d08d97cc0c02977afec02bf3f6a20e24da2fdbecad2dcef1de95b0575')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  make INSTALL_PATH="$pkgdir/usr/bin" install
}
