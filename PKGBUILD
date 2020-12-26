# Maintainer: Alexander Shpilkin <ashpilkin at gmail dot com>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>

pkgname=uacme
pkgver=1.6
pkgrel=1
pkgdesc='An ACMEv2 client written in plain C with minimal dependencies'
arch=('i686' 'x86_64')
url='https://github.com/ndilieto/uacme/'
makedepends=('asciidoc' 'libev')
depends=('curl' 'gnutls')
optdepends=('libev: ualpn')
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ndilieto/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1f3282e659d1486105e2f10150a88aa338be9c644ecd817a0cca5a4a9dae990f') # not upstream

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
