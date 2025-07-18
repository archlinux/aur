# Maintainer: Zesko
pkgname=systemd-timer-notify
pkgver=1.4.0
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
sha256sums=('219808996a950f69517e5f6b6856813e3d97d95041d3958415cd1a630e376d4f')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm 755 "usr/share/doc/${pkgname}/"
  cp -r screenshots README.md CHANGELOG.md "usr/share/doc/${pkgname}/"
  cp -r usr etc "$pkgdir"
}
