# Maintainer: Wai <waicool20@gmail.com>
pkgname=fw-fanctrl-ui-git
pkgver=r11.9d40c69
pkgrel=2
pkgdesc="Framework Fan Control UI"
arch=('any')
url="https://github.com/waicool20/fw-fanctrl-ui"
license=('GPLv3')
source=('fw-fanctrl-ui::git+https://github.com/waicool20/fw-fanctrl-ui.git')
md5sums=("SKIP")
depends=(
  'fw-fanctrl'
  'python-pystray'
)

pkgver() {
  cd "fw-fanctrl-ui"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "${srcdir}/fw-fanctrl-ui"

  install_dir="$pkgdir/opt/fw-fanctrl-ui/"
  desktop_dir="$pkgdir/usr/share/applications"

  mkdir -p "$install_dir" "$desktop_dir"

  cp fw-fanctrl-ui.py "$install_dir"
  cp favicon.ico "$install_dir"
  cp -r icon "$install_dir"
  cp fw-fanctrl-ui.desktop "$desktop_dir"
}

