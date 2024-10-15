# Maintainer: BryanLiang <liangrui.ch at gmail dot com>

pkgname="ufw-docker-git"
_pkgname="ufw-docker"
pkgver=r150.3d6896c
pkgrel=1
pkgdesc="To Fix The Docker and UFW Security Flaw Without Disabling Iptables."
arch=("any")
url="https://github.com/chaifeng/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("ufw" "bash")
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/chaifeng/${_pkgname}.git")
sha256sums=("SKIP")
install=ufw-docker.install

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/ufw-docker/LICENSE"
    install -Dm755 ufw-docker "${pkgdir}/usr/bin/ufw-docker"
}
