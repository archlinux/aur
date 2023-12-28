# Maintainer: muio <muio at airmail dot cc>

pkgname=cmake-init
_name=${pkgname#python-}
pkgver=0.39.0
pkgrel=1
pkgdesc="The missing CMake project initializer"
arch=('any')
url="https://github.com/friendlyanon/cmake-init"
license=('GPL3')
depends=('python3')
source=("cmake-init-${pkgver}.pyz::https://github.com/friendlyanon/cmake-init/releases/download/v${pkgver}/cmake-init.pyz")
sha256sums=('01d14c029a70e8a6f12b2b3d06c4551d53ad7e91c0a8a5e90905385dc55e3069')

#pkgver() {
#	curl -sH "Accept: application/vnd.github.v3+json" 'https://api.github.com/repos/friendlyanon/cmake-init/tags'  | jq -r '.[0].name' | sed 's/v//;s/-/./;s/-/./'
#}

package() {
    cd "$srcdir/$_pkgname"
    install -D -m755 "cmake-init-${pkgver}.pyz" "${pkgdir}/usr/bin/cmake-init"
}
