# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>
# Contributor: Pat Brisbin <pbrisbin@gmail.com>
pkgname='gitsh'
pkgver=0.13
pkgrel=1
pkgdesc='An interactive shell for git'
arch=('i686' 'x86_64')
url="https://github.com/thoughtbot/gitsh"
license=('custom')
depends=('ruby' 'readline')
source=("https://github.com/thoughtbot/gitsh/releases/download/v$pkgver/gitsh-$pkgver.tar.gz")
sha512sums=('201c8d4145e854f94fc9ead957c221f1d367ddc56a6650947f26d5ff38522042644a331b5ee2e795fce995aa6e0ccb52c1083bb46d8ba90f55aaaeeca44889fa')

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
