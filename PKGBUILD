# Maintainer: Jonas DOREL <jonas at dorel dot me>
pkgname=systemd-timer-docker-system-prune-git
pkgver=latest
pkgrel=1
pkgdesc="Systemd timer to prune docker system"
arch=('any')
url="https://gitlab.com/jdorel-archlinux/systemd-docker-system-prune"
license=('GPL')
depends=('systemd-service-docker-system-prune')
makedepends=('git')
provides=('systemd-timer-docker-system-prune')
source=("${pkgname}::git+https://gitlab.com/jdorel-archlinux/systemd-docker-system-prune")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"

	install -Dm 644 docker-system-prune.timer "$pkgdir/usr/lib/systemd/system/docker-system-prune.timer"
}
