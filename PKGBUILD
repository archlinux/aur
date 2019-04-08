# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=scrumplexweb
pkgver=19.04.1
pkgrel=1
pkgdesc="Static website of Sefa Eyeoglu"
arch=("any")
url="https://scrumplex.net"
license=("GPL")
builddepends=("npm")

source=("https://gitlab.com/Scrumplex/scrumplex.net/-/archive/${pkgver}/scrumplex.net-${pkgver}.tar.bz2")
# automatically generated with updpkgsums
sha512sums=('7afddca6e9f15e4f58af5dcdbe26fd2698924360a9ebdd8516f95500a6c2270b6823fc857fd1037312177cc5e4e8cb444495f7988a175a4df94a3210586c3097')

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
