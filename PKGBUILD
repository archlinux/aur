# Maintainer: Milan Šťastný <milan@statnej.ch>

pkgname=eam-git
pkgver=1.0.10
pkgrel=1
pkgdesc='Epic Asset Manager used to manage assets from Epic Games Store'
url='https://github.com/AchetaGames/Epic-Asset-Manager'
license=(MIT)
arch=(x86_64)
makedepends=(cargo rust gtk3 libsoup meson)
conflicts=(eam)
provides=(eam)
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
    arch-meson Epic-Asset-Manager build
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build
}
