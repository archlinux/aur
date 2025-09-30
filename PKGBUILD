# Maintainer: dmnmsc
pkgname=kraiser-git
pkgver=1.3.0.gdd14712  # will be set automatically by pkgver()
pkgrel=1
pkgdesc="Run or raise apps on KDE Plasma Wayland using kdotool (git version)"
arch=('any')
url="https://github.com/dmnmsc/kraiser"
license=('GPL3')
depends=('bash' 'kdotool')
makedepends=('git')
provides=('kraiser')
conflicts=('kraiser')
source=("git+$url.git")
sha256sums=('SKIP')
install="$pkgname.install"

pkgver() {
  cd "$srcdir/kraiser"
  # generate version string: latest tag + revision count + short commit
  git describe --tags --long --always | sed 's/^v//;s/-/./g'
}

package() {
  cd "$srcdir/kraiser"
  install -Dm755 kraiser.sh "$pkgdir/usr/bin/kraiser"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

