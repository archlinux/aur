# Maintainer: Sam Whited <sam@samwhited.com>
# Forked from buildkit-git by Victor <victor@xirion.net>

pkgname=buildkit
pkgver=0.6.2
pkgrel=2
pkgdesc='A toolkit for converting source code to build artifacts in an efficient, expressive and repeatable manner.'
arch=('any')
url="https://github.com/moby/buildkit"
license=('Apache')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(docker)
makedepends=(make)
source=("https://github.com/moby/buildkit/archive/v${pkgver}.tar.gz")

sha256sums=('1eaf2c85c20d8da283e48548954484883354df66c6a4c2dc87bba7514a7ba99e')

build() {
  cd "$pkgname-${pkgver}"
  make
}

package() {
  cd "$pkgname-${pkgver}"

  make DESTDIR="$pkgdir/usr/" install
}

# vim: ts=2 sw=2 et:
