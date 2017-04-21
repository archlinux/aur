# Maintainer: zimbatm <zimbatm@zimbatm.com>
pkgname=direnv
pkgver=2.11.3
pkgrel=1
pkgdesc='a shell extension that manages your environment'
arch=('x86_64' 'i686')
url='http://direnv.net'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/direnv/direnv/archive/v$pkgver.tar.gz")

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

sha256sums=('2d34103a7f9645059270763a0cfe82085f6d9fe61b2a85aca558689df0e7b006')
