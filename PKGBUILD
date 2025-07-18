# Maintainer: Zesko
pkgname=systemd-timer-notify-git
pkgver=r39.d665997
pkgrel=1
pkgdesc="Notifies when systemd timers start services; auto-closes on finish."
arch=('any')
url="https://gitlab.com/Zesko/systemd-timer-notify.git"
license=('GPL3')
depends=('python' 'libnotify' 'systemd' 'openssh')
optdepends=('dunst')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/${pkgname%-git}.conf")
source=('git+https://gitlab.com/Zesko/systemd-timer-notify.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -dm 755 "usr/share/doc/${pkgname%-git}/"
  cp -r screenshots README.md CHANGELOG.md "usr/share/doc/${pkgname%-git}/"
  cp -r usr etc "$pkgdir"
}
