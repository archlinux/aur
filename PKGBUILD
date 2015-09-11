# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>
# Contributor: Pat Brisbin <pbrisbin@gmail.com>
pkgname='gitsh'
pkgver=0.10
pkgrel=1
pkgdesc='An interactive shell for git'
arch=('any')
url="https://github.com/thoughtbot/gitsh"
license=('custom')
depends=('ruby')
source=("https://github.com/thoughtbot/gitsh/releases/download/v$pkgver/gitsh-$pkgver.tar.gz")
sha512sums=('caed217675151406c7084b927b9f45a509b8d6095824707a3f27d7252b7b07c3f4483d6fe481adc64988dd5ad2328ccea374b8e40dad42e4e8fa57cd212e7804')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
     --disable-debug \
     --disable-dependency-tracking \
     --disable-silent-rules \
     --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
