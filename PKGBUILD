# Maintainer:  <aur@kaangenc.me>
pkgname=nanomsgxx
pkgver=0.2
pkgrel=1
pkgdesc='Nanomsg bindings for C++11.'
arch=('i686' 'x86_64')
url='http://achille-roussel.github.io/nanomsgxx'
license=('MIT')
depends=('nanomsg' 'gcc-libs')
makedepends=('python2')
source=('https://github.com/achille-roussel/nanomsgxx/archive/0.2.tar.gz')
md5sums=('2d4aeb324302055dff3687d0ac31c070')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 ./waf configure --prefix="$pkgdir/usr/"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 ./waf build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 ./waf install

  install -D -t "$pkgdir/usr/share/licenses/nanomsgxx/" LICENSE
}
