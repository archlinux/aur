# Maintainer: Zesko
pkgname=journalctl-desktop-notification-git
pkgver=r51.c23509b
pkgrel=1
pkgdesc="Displays notifications for journalctl error messages."
arch=('any')
url="https://gitlab.com/Zesko/journalctl-desktop-notification"
license=('GPL3')
depends=('libnotify' 'systemd')
optdepends=('dunst')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/${pkgname%-git}.conf")
source=('git+https://gitlab.com/Zesko/journalctl-desktop-notification.git')
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
