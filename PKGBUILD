# Maintainer: Zesko
pkgname=systemd-timer-notify-git
pkgver=r8.fe91de7
pkgrel=1
pkgdesc="The notification displays on Desktop when systemd-service is started and processed, the notification will be closed automatically when systemd-service's process is done."
arch=('any')
url="https://gitlab.com/Zesko/systemd-timer-notify.git"
license=('GPL3')
depends=('python' 'dunst' 'systemd')
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
  cp -vr usr etc "$pkgdir"
}
