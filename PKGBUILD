# Maintainer: zimbatm <zimbatm@zimbatm.com>
pkgname=direnv
pkgver=2.8.1
pkgrel=1
pkgdesc='a shell extension that manages your environment'
arch=('x86_64' 'i686')
url='http://direnv.net'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/direnv/direnv/archive/v$pkgver.tar.gz")
sha256sums=('918194e91435bf7ebb07705ba901e822dad7a01546e29e285043c3976fee115b')

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
