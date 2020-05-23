# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=wluma-als-emulator-git
_pkgname=${pkgname%-git}
pkgver=1.0.0.r0.g406f9d7
pkgrel=1
pkgdesc="Ambient light sensor emulator for wluma"
license=(MIT)
url="https://github.com/cyrinux/${_pkgname}"
depends=('wluma')
optdepends=(
    'python-pillow: for webcam strategy',
    'ffmpeg: for webcam strategy'
)
arch=(any)
makedepends=('git')
conflicts=('wluma-als-emulator')
provides=('wluma-als-emulator')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

package() {
    cd "${_pkgname}"
    make install DESTDIR="${pkgdir}"
}
