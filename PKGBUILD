# Maintainer: Zesko
pkgname=systemd-timer-notify
pkgver=1.5.0
pkgrel=1
pkgdesc="Notifies when systemd timers start services; auto-closes on finish."
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
sha256sums=('b58d92c7a2b3660c20689fa4f5d38a2ca2b504b1157a974e9bc638f29e90b486')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm 755 "usr/share/doc/${pkgname}/"
  cp -r screenshots README.md CHANGELOG.md "usr/share/doc/${pkgname}/"
  cp -r usr etc "$pkgdir"
}
