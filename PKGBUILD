# Maintainer: zimbatm <zimbatm@zimbatm.com>
pkgname=direnv
pkgver=2.6.1
pkgrel=1
pkgdesc='a shell extension that manages your environment'
arch=('x86_64' 'i686')
url='http://direnv.net'
license=('MIT')
makedepends=('go')
source=("$pkgname.tar.gz::https://github.com/zimbatm/direnv/archive/v$pkgver.tar.gz")
sha256sums=('b80396cebae596ea8e48ff1a52ac1337368fc729f0731036b9b44b3e531cda7e')

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
