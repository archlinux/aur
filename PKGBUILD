# Maintainer: Greg Holmes <greg at greg dot holmes dot name>
pkgname=systemd-service-podman-system-prune-git
pkgver=r2.9b61206
pkgrel=1
pkgdesc="Systemd service to force a podman system prune"
arch=('any')
url="https://github.com/greboid/systemd-podman-system-prune"
license=('MIT')
makedepends=('git')
provides=('systemd-service-podman-system-prune')
source=(
  "$pkgname"::"git+https://github.com/greboid/systemd-podman-system-prune.git"
)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/$pkgname"
        install -Dm 644 podman-system-prune.service "$pkgdir/usr/lib/systemd/system/podman-system-prune.service"
}
