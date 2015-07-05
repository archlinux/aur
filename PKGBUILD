# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>
# Contributor: Pat Brisbin <pbrisbin@gmail.com>
pkgname='gitsh'
pkgver=0.9
pkgrel=1
pkgdesc='An interactive shell for git'
arch=('any')
url="https://github.com/thoughtbot/gitsh"
license=('custom')
depends=('ruby')
source=("https://github.com/thoughtbot/gitsh/releases/download/v$pkgver/gitsh-$pkgver.tar.gz")
sha512sums=('2b22e5c2ed61c9dc0f8ec9e951f7ca54a0eefde07ffb94912d9962e9e21195bd840ec1b453a794a153dd18f9b69ac9ef329a0283044c54fe09cb5e10adb41884')

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
