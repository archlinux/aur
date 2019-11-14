# Maintainer: Sam Whited <sam@samwhited.com>
# Forked from buildkit-git by Victor <victor@xirion.net>

pkgname=buildkit
pkgver=0.6.3
pkgrel=1
pkgdesc='A toolkit for converting source code to build artifacts in an efficient, expressive and repeatable manner.'
arch=('any')
url="https://github.com/moby/buildkit"
license=('Apache')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(docker)
makedepends=(make)
source=("https://github.com/moby/buildkit/archive/v${pkgver}.tar.gz")

sha256sums=('b455ee83340f08b30c64918da2cce6e4f97cd8d0f65aeb3f640ca93d19f17e56')

build() {
  cd "$pkgname-${pkgver}"
  make
}

package() {
  cd "$pkgname-${pkgver}"

  make DESTDIR="$pkgdir/usr/" install
}

# vim: ts=2 sw=2 et:
