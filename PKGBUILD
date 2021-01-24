# Maintainer: Jonas DOREL <jonas at dorel dot me>
pkgname=systemd-service-docker-system-prune-git
pkgver=r1.6a092d9
pkgrel=1
pkgdesc="Systemd service to prune docker system"
arch=('any')
url="https://gitlab.com/jdorel-archlinux/systemd-docker-system-prune"
license=('GPL')
makedepends=('git')
provides=('systemd-service-docker-system-prune')
source=("${pkgname}::git+https://gitlab.com/jdorel-archlinux/systemd-docker-system-prune")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"

	install -Dm 644 docker-system-prune.service "$pkgdir/usr/lib/systemd/system/docker-system-prune.service"
}
