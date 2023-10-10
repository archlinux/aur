# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: Vincent Demeester <vincent@sbr.pm>
# Contributor: Pat Brisbin <pbrisbin@gmail.com>
# Contributor: Max Falk <gmdfalk@gmail.com>
# Contributor: Mikhail f. Shiryaev <mr<dot>felixoid<at>gmail<dot>com>
pkgname=rcm
pkgver=1.3.6
pkgrel=1
pkgdesc="rc file (dotfiles) management"
arch=('any')
url="https://github.com/thoughtbot/$pkgname"
license=('BSD')
source=("https://thoughtbot.github.io/$pkgname/dist/$pkgname-$pkgver.tar.gz")
conflicts=(${pkgname}-git)
provides=(${pkgname})
sha256sums=(
  f4fdfbc451d1fb5764531290a202a0a871f6b81ba3c01a6b76c49435c85080a5
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --disable-silent-rules \
    --prefix=/usr
      make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
