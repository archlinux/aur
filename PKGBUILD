# Maintainer: Catalin Airimitoaie <catalin@domatix.com>

pkgname=unifiedmin
pkgver=0.2
pkgrel=1
pkgdesc="Unifydmin fork with custom port connection and SSH keys administration."
url="https://gitlab.com/cairimitoaie/unifydmin"
arch=(any)
license=(GPL)
depends=(gtk3 fabric)
makedepends=(meson python)
provides=(org.gabmus.unifydmin)
source=("https://gitlab.com/cairimitoaie/unifydmin/-/archive/${pkgver}/unifydmin-${pkgver}.tar.gz")
sha256sums=('cda658bc761454b9fcd0919e8ea0534dc1febb6322dd678687ba491cad5175e5')
conflicts=(unifydmin unifydmin-git)
build() {
    arch-meson unifydmin-${pkgver} build
    ninja -C build
}

check() {
    meson test -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build
}

