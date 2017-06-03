# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>
# Contributor: Pat Brisbin <pbrisbin@gmail.com>
pkgname='gitsh'
pkgver=0.12
pkgrel=1
pkgdesc='An interactive shell for git'
arch=('i686' 'x86_64')
url="https://github.com/thoughtbot/gitsh"
license=('custom')
depends=('ruby' 'readline')
source=("https://github.com/thoughtbot/gitsh/releases/download/v$pkgver/gitsh-$pkgver.tar.gz")
sha512sums=('7f8485a150e2b410e41021f415cfadbd5c7d1e65c149cee9d7b77ec5f5caf34dfd21ba140bedd5ce1474ade75716ffb70b39cc7ed6102a6d61c2a5e70fc37dc7')

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
