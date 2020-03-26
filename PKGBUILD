# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=buildkit
pkgver=0.7.0
pkgrel=1
pkgdesc='A toolkit for converting source code to build artifacts in an efficient, expressive and repeatable manner.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/moby/buildkit"
license=('Apache')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('runc' 'containerd')
makedepends=('make')
source=("buildkit-${pkgver}.tar.gz::https://github.com/moby/buildkit/archive/v${pkgver}.tar.gz")

sha512sums=('b902e17f08b5ae48bbed07899ea350d77f346a7a45fdb0a48f6e374168fb2112742625fd6b719acccdf8736833ff1815797fb220ae2e38b82ddd210ed69da176')

build() {
  cd "$pkgname-${pkgver}"
  make
}

package() {
  cd "$pkgname-${pkgver}"

  make DESTDIR="$pkgdir/usr/" install
}

# vim: ts=2 sw=2 et:
