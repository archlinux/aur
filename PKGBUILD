# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=buildkit
pkgver=0.6.4
pkgrel=3
pkgdesc='A toolkit for converting source code to build artifacts in an efficient, expressive and repeatable manner.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/moby/buildkit"
license=('Apache')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('runc' 'containerd')
makedepends=('make')
source=("buildkit-${pkgver}.tar.gz::https://github.com/moby/buildkit/archive/v${pkgver}.tar.gz")

sha512sums=('ac014ba5b5f0bdfcddbfe00ac63c32976cc694fc14cdb57516bd3a902744a94667c4db81eddbde94da82c32355b6844179952fa2c1102791c0aea2095b04fbbb')

build() {
  cd "$pkgname-${pkgver}"
  make
}

package() {
  cd "$pkgname-${pkgver}"

  make DESTDIR="$pkgdir/usr/" install
}

# vim: ts=2 sw=2 et:
