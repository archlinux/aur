_pkgname=yavta
pkgname=${_pkgname}-git
pkgver=r134.547e499
pkgrel=1
pkgdesc='Yet Another V4L2 Test Application'
arch=('x86_64' 'i686' 'aarch64')
url='https://git.ideasonboard.org/yavta.git'
makedepends=('git' 'meson')
license=('GPL2')
source=("${_pkgname}::git+https://git.ideasonboard.org/yavta.git")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson build "${_pkgname}"
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
