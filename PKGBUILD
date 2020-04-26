# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
pkgname=sweet-kvantum-git
pkgver=r112.0b4e52a
pkgrel=1
pkgdesc="Sweet theme for Kvantum"
arch=(any)
url="https://github.com/EliverLara/Sweet"
license=('CCPL')
depends=(kvantum-qt5)
makedepends=(git)
provides=(${pkgname/-git/})
conflicts=(${pkgname/-git/})
source=("${pkgname}::git+https://github.com/EliverLara/Sweet.git#branch=nova")
sha256sums=(SKIP)

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}/kde/kvantum"
    install -Dm644 -t "${pkgdir}/usr/share/Kvantum/Sweet" Sweet.svg Sweet.kvconfig
}
