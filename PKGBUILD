# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=lenovo-thinkpad-yoga-11e-chromebook-git
pkgver=1.0.0.r1.g62d68d4
pkgrel=1
pkgdesc="Fixes for the Lenove Yoga Thinkpad 11e Chromebook"
arch=('any')
url="https://github.com/kcolford/lenovo-thinkpad-yoga-11e-chromebook"
license=('unknown')
groups=()
depends=()
makedepends=('git')
optdepends=('linux-max98090: for working sound')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+$url")
md5sums=('SKIP')
noextract=()

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/v//;s/-/.r/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/usr" install
}
