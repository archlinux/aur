# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=scrumplexweb
pkgver=19.04.2
pkgrel=1
pkgdesc="Static website of Sefa Eyeoglu"
arch=("any")
url="https://scrumplex.net"
license=("GPL")
builddepends=("npm")

source=("https://gitlab.com/Scrumplex/scrumplex.net/-/archive/${pkgver}/scrumplex.net-${pkgver}.tar.bz2")
# automatically generated with updpkgsums
sha512sums=('ca5ff7b74d1caf40a190f8864c8d916337039c9f6fa2ed4b49e20bb34fbc6655cc7ce9fc339a5c876942dd833102974693df66cd9cae0c115cb15968d8baf589')

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
