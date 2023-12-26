# Maintainer: Kenji 'Nhqml' Gaillac <kenji.gaillac@epita.fr>
pkgname=nss-docker
pkgver=0.2
pkgrel=1
pkgdesc="Hostname resolution for Docker containers"
arch=('x86_64')
url="https://github.com/nhqml/nss-docker"
license=('GPL3')
depends=('libcurl.so' 'cjson>=1.7.15')
makedepends=('git' 'meson>=1.3.0')
provides=('libnss_docker.so=2-64')
source=("git+https://github.com/nhqml/nss-docker.git")
md5sums=('SKIP')

build() {
    arch-meson "${pkgname}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
