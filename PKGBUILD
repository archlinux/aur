# Maintainer: Zesko
pkgname=journalctl-desktop-notification
pkgver=1.3.0
pkgrel=1
pkgdesc="Notifies you on the desktop when any error message appears in the Journalctl log."
arch=('any')
url="https://gitlab.com/Zesko/journalctl-desktop-notification"
license=('GPL3')
depends=('dunst' 'systemd')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}.conf")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f5407b41ecb4197147994f717ab8df7f729b64aa93ade61314720808d5febacd')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm 755 "usr/share/doc/${pkgname}/"
  cp -r screenshots README.md CHANGELOG.md "usr/share/doc/${pkgname}/"
  cp -vr usr etc "$pkgdir"
}
