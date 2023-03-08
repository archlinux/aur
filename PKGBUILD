# Maintainer: bziemons <ben@rs485.network>
pkgname=posixsignalmanager-git
pkgver=r81.4426a73
pkgrel=2
pkgdesc="Library for safe, synchronous and asynchronous handling of posix signals for Qt applications and libraries"
arch=("x86_64")
url="https://github.com/textshell/posixsignalmanager"
license=('Boost')
depends=('qt5-base')
makedepends=('meson' 'git')
provides=(posixsignalmanager)
conflicts=(posixsignalmanager)
options=(strip)
source=("git+https://github.com/textshell/posixsignalmanager.git")
md5sums=("SKIP")

pkgver() {
    cd "posixsignalmanager"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson posixsignalmanager _build
    meson compile -C _build
}

package() {
    DESTDIR="$pkgdir" meson install -C _build
}
