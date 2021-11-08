# Maintainer: A. Husen <hi@husen.id>
pkgname=docker-slim-bin
_pkgname=docker-slim
pkgver=1.37.1
pkgrel=1
pkgdesc="Don't change anything in your Docker container image and minify it by up to 30x (and for compiled languages even more) making it secure too! (free and open source)"
arch=('x86_64' 'aarch64')
url="https://github.com/docker-slim/docker-slim"
license=('Apache')
provides=('docker-slim' 'docker-slim-sensor')
conflicts=('docker-slim')
source_x86_64=("$_pkgname-$pkgver.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux.tar.gz")
source_aarch64=("$_pkgname-$pkgver.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux_arm64.tar.gz")
sha512sums_x86_64=('5e7d1cca5eb555c77f71fc2272e9c6fc9a680f1c27f35efdc80b96a35d6771d5958791074f56e4ba265fd6168f6630dd2c2b29581b88bc1ae5cdf9bc3f3dd42c')
sha512sums_aarch64=('5e7d1cca5eb555c77f71fc2272e9c6fc9a680f1c27f35efdc80b96a35d6771d5958791074f56e4ba265fd6168f6630dd2c2b29581b88bc1ae5cdf9bc3f3dd42c')

package() {
	cd "${srcdir}"

    install -Dm755 "dist_linux"*"/$_pkgname"                        "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "dist_linux"*"/${_pkgname}-sensor"               "${pkgdir}/usr/bin/${_pkgname}-sensor"
}
