# Maintainer: Zesko
pkgname=systemd-timer-notify
pkgver=1.2.0
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
sha256sums=('e0365ae6c87250cdedf10825d6444165dc0240acc886d44db459209fce7b1b23')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm 755 "usr/share/doc/${pkgname}/"
  cp -r screenshots README.md CHANGELOG.md "usr/share/doc/${pkgname}/"
  cp -r usr etc "$pkgdir"
}
