# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: Vincent Demeester <vincent@sbr.pm>
# Contributor: Pat Brisbin <pbrisbin@gmail.com>
# Contributor: Max Falk <gmdfalk@gmail.com>
# Contributor: Mikhail f. Shiryaev <mr<dot>felixoid<at>gmail<dot>com>
pkgname=rcm
pkgver=1.3.4
pkgrel=1
pkgdesc="rc file (dotfiles) management"
arch=('any')
url="https://github.com/thoughtbot/$pkgname"
license=('BSD')
source=("https://thoughtbot.github.io/$pkgname/dist/$pkgname-$pkgver.tar.gz")
conflicts=(${pkgname}-git)
provides=(${pkgname})
sha256sums=(9b11ae37449cf4d234ec6d1348479bfed3253daba11f7e9e774059865b66c24a)

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
