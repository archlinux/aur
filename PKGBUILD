# Maintainer: zimbatm <zimbatm@zimbatm.com>
pkgname=direnv
pkgver=2.7.0
pkgrel=1
pkgdesc='a shell extension that manages your environment'
arch=('x86_64' 'i686')
url='http://direnv.net'
license=('MIT')
makedepends=('go')
source=("$pkgname.tar.gz::https://github.com/zimbatm/direnv/archive/v$pkgver.tar.gz")
sha256sums=('3cfa8f41e740c0dc09d854f3833058caec0ea0d67d19e950f97eee61106b0daf')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  [[ -f /etc/profile.d/go.sh ]] && source /etc/profile.d/go.sh
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install DESTDIR=$pkgdir/usr
}

# vim:set ts=2 sw=2 et:
