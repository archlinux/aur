# Maintainer: Zesko
pkgname=systemd-timer-notify
pkgver=1.1.0
pkgrel=1
pkgdesc="Displays a desktop notification when a systemd service starts and automatically closes it when the service finishes."
arch=('any')
url="https://gitlab.com/Zesko/systemd-timer-notify"
license=('GPL3')
depends=('python' 'dunst' 'systemd' 'openssh')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}.conf")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('947a08f394df96f3bac77e97a2a3d2dc4c3ea93c83b381ff2d5d4f350750537d')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm 755 "usr/share/doc/${pkgname%-git}/"
  cp -r screenshots README.md CHANGELOG.md "usr/share/doc/${pkgname%-git}/"
  cp -vr usr etc "$pkgdir"
}
