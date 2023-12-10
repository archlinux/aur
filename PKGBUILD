# Contributor: LaserEyess lasereyess@lasereyess.net

pkgname=tarpyt-git
_pkgname=TarPyt
pkgver=v0.0.1.2617ea0
pkgrel=1
pkgdesc='A Python ssh/http/smtp/etc. tarpit'
arch=('any')
url='https://github.com/LaserEyess/TarPyt'
license=('GPL3')
depends=('libsystemd' 'python')
makedepends=('git' 'meson')
provides=('tarpyt')
conflicts=('tarpyt')
source=('git+https://github.com/LaserEyess/TarPyt.git')
sha512sums=('SKIP')

pkgver() {
  # No tags (yet)
  echo "v0.0.1.$(git -C $_pkgname rev-parse --short HEAD)"
}

prepare() {
  meson setup build "$_pkgname" --prefix=/usr
}

package() {
  meson install -C build --destdir="$pkgdir"
}
