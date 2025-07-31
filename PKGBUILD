# Maintainer: Marvin1099
pkgname=user-updater
pkgver=0.1.2
pkgrel=1
pkgdesc="A simple bash tool for automatic system updates using topgrade, featuring a background systemd service and a lightweight GUI to notify users of ongoing updates"
arch=('any')
url="https://codeberg.org/marvin1099/user_updater"
license=('AGPLv3')
depends=('bash' 'grep' 'coreutils' 'gawk' 'git' 'procps-ng' 'sed' 'shadow' 'sudo' 'systemd' 'topgrade' 'util-linux' 'yad' 'findutils')
optdepends=('docker' 'flatpak' 'python-pip' 'pipx' 'rust' 'npm' 'rubygems' 'xorg-xrandr')
source=("git+$url.git")
md5sums=('SKIP')
install=user_updater.install

package() {
  install -dm755 "$pkgdir/var/lib/user_updater"
  cp -a "$srcdir/user_updater/." "$pkgdir/var/lib/user_updater/"
  git -C "/var/lib/user_updater/" remote set-url origin "https://codeberg.org/marvin1099/user_updater"
  chown -R root:root "/var/lib/user_updater"
  rm "/var/lib/user_updater/.git/objects/info/alternates"
}
