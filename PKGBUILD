# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>
# Contributor: Pat Brisbin <pbrisbin@gmail.com>
pkgname='gitsh'
pkgver=0.11.1
pkgrel=1
pkgdesc='An interactive shell for git'
arch=('i686' 'x86_64')
url="https://github.com/thoughtbot/gitsh"
license=('custom')
depends=('ruby' 'readline')
source=("https://github.com/thoughtbot/gitsh/releases/download/v$pkgver/gitsh-$pkgver.tar.gz")
sha512sums=('7df750d12e5e1ed27678eed00f1b7576ca6a035f390d83ececd87f148625ec0dca338ffabacac9fe1c616c58f077041738bb8a8f33844c8312d9f7da0db4cf7a')

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
