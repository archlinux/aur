# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=buildkit
pkgver=0.6.3
pkgrel=2
pkgdesc='A toolkit for converting source code to build artifacts in an efficient, expressive and repeatable manner.'
arch=('any')
url="https://github.com/moby/buildkit"
license=('Apache')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('runc' 'containerd')
makedepends=('make')
source=("buildkit-${pkgver}.tar.gz::https://github.com/moby/buildkit/archive/v${pkgver}.tar.gz")

sha512sums=('99b8f68f4deecd2ade1c2822df0b08fcbff315f37b92a9d7af1c7661f7e4e8522ae8381735413dec1074b497983a4987a437895b9007197085f606ab48e26791')

build() {
  cd "$pkgname-${pkgver}"
  make
}

package() {
  cd "$pkgname-${pkgver}"

  make DESTDIR="$pkgdir/usr/" install
}

# vim: ts=2 sw=2 et:
