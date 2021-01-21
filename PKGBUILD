# Maintainer: lmartinez-mirror
pkgname=fish-systemd-git
pkgver=r7.ae58bc5
pkgrel=1
pkgdesc="Comfortable fish aliases for systemctl commands"
arch=('any')
url="https://github.com/wawa19933/fish-systemd"
license=('Unlicense')
groups=('fish-plugins')
depends=('fish')
makedepends=('git')
provides=('fish-systemd')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm644 conf.d/systemd-abbr.fish "$pkgdir/etc/fish/conf.d/systemd-abbr.fish"
  install -Dm644 systemctl.fish "$pkgdir/usr/share/fish/functions/systemctl.fish"
}

