# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=scrumplexweb
pkgver=19.05.1
pkgrel=1
pkgdesc="Static website of Sefa Eyeoglu"
arch=("any")
url="https://scrumplex.net"
license=("GPL")
makedepends=("yarn")

source=("https://gitlab.com/Scrumplex/scrumplex.net/-/archive/${pkgver}/scrumplex.net-${pkgver}.tar.bz2")
# automatically generated with updpkgsums
sha512sums=('418e531b4d1437bc65ae19781d6085a48348c868c6b5a19361e759b4cfaabee0cce2caba22ab5fc771afe57789e08c2b4faaa15aee1cca8c3ed5ad2686449042')

prepare() {
    cd "${srcdir}/scrumplex.net-${pkgver}"
    yarn install --cache-folder "${srcdir}/yarn-cache"
}

build() {
    cd "${srcdir}/scrumplex.net-${pkgver}"
    yarn build # defaults to build:prod
}

package() {
    find "${srcdir}/scrumplex.net-${pkgver}/public" -type f -exec install -Dm 644 -t "${pkgdir}/usr/share/webapps/scrumplexweb" "{}" \;
}
