# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=scrumplexweb
pkgver=19.04.3
pkgrel=1
pkgdesc="Static website of Sefa Eyeoglu"
arch=("any")
url="https://scrumplex.net"
license=("GPL")
builddepends=("npm")

source=("https://gitlab.com/Scrumplex/scrumplex.net/-/archive/${pkgver}/scrumplex.net-${pkgver}.tar.bz2")
# automatically generated with updpkgsums
sha512sums=('73aedd64b2d9c4e7cc9eb5b947e279e2af10a354d664f28ad5cbad5264a52aedd38b36ec298d0f8f48d47966d3c37db2bf604297ee8bf197de696f07be485996')

prepare() {
    cd "${srcdir}/scrumplex.net-${pkgver}"
    npm install --cache "${srcdir}/npm-cache"
}

build() {
    cd "${srcdir}/scrumplex.net-${pkgver}"
    npm run build-prod --cache "${srcdir}/npm-cache"
}

package() {
    find "${srcdir}/scrumplex.net-${pkgver}/public" -type f -exec install -Dm 644 -t "${pkgdir}/usr/share/webapps/scrumplexweb" "{}" \;
}
