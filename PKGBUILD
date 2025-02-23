# Maintainer: Zesko
pkgname=systemd-timer-notify
pkgver=1.3.0
pkgrel=1
pkgdesc="Displays a desktop notification when a systemd service starts and automatically closes it when the service finishes."
arch=('any')
url="https://gitlab.com/Zesko/systemd-timer-notify"
license=('GPL3')
depends=('python' 'libnotify' 'systemd' 'openssh')
optdepends=('dunst')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}.conf")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4f5d42612794edbf8c619310ab18709ae0d089c75f0515dde04fb1b96a1bb2c0')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm 755 "usr/share/doc/${pkgname}/"
  cp -r screenshots README.md CHANGELOG.md "usr/share/doc/${pkgname}/"
  cp -r usr etc "$pkgdir"
}
