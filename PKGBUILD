# Maintainer: w568w <w568w at outlook dot com>

pkgname="podman-docker-registry"
pkgver='1'
pkgrel='1'
pkgdesc="Set podman's unqualified registry to docker.io"
arch=('any')
license=('Unlicense')
source=('docker-io.conf')
sha256sums=('dd2e70735917f35cd6ff8e1d68925f51ef5062c7eda3f3e79011053a14710511')
depends=('containers-common')
optdepends=('podman: this package is mostly useless without podman')

package() {
    install -dm755 "${pkgdir}/etc/containers/registries.conf.d"
    install -m644 "${srcdir}/docker-io.conf" "${pkgdir}/etc/containers/registries.conf.d/99-docker-io.conf"
}
