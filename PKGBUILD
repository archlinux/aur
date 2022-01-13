# Maintainer: Jat <chat@jat.email>

_pkgname=obs-multi-rtmp
pkgname="${_pkgname}-git"
pkgver=r96.b27ea4b
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('GPL')
depends=('obs-studio')
makedepends=('git' 'cmake')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    ./build_linux.sh
}

package() {
    cp -aT "${srcdir}/${_pkgname}/dist" ${pkgdir}
}
