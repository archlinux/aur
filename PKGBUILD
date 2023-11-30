# Maintainer: Tuure Piitulainen <tuure.piitulainen@gmail.com>

pkgname="vivify"
pkgver="0.1.1"
pkgrel=3
pkgdesc="Markdown preview tool which can be used standalone or plug into an editor like (Neo)Vim"
arch=("x86_64")
url="https://github.com/jannis-baum/vivify"
license=("unknown")
depends=("jq" "gcc-libs" "bash")
makedepends=("yarn")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jannis-baum/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=("5d04c08c3172927cb219feb34d6d8b35")

build() {
	cd "${pkgname}-${pkgver}"
        yarn install
        ./build.sh
}

package() {
	cd "${pkgname}-${pkgver}/bin/linux"
        install -Dm755 ./viv           "${pkgdir}/usr/bin/viv"
        install -Dm755 ./vivify-server "${pkgdir}/usr/bin/vivify-server"
}
