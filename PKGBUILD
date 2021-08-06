# Maintainer: A. Husen <hi@husen.id>
pkgname=docker-slim-bin
_pkgname=docker-slim
pkgver=1.36.2
pkgrel=1
pkgdesc="Don't change anything in your Docker container image and minify it by up to 30x (and for compiled languages even more) making it secure too! (free and open source)"
arch=('x86_64' 'aarch64')
url="https://github.com/docker-slim/docker-slim"
license=('Apache')
provides=('docker-slim' 'docker-slim-sensor')
conflicts=('docker-slim')
source_x86_64=("$_pkgname-$pkgver.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux.tar.gz")
source_aarch64=("$_pkgname-$pkgver.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux_arm64.tar.gz")
sha512sums_x86_64=('f4672cb77614294b566170dcb97f7396db6bb0720a869b59e31fe4cdf49b6382529dfa766ecfb34322fb9e03023fe51a29a3ce1da0c1c71f373e60998d74f656')
sha512sums_aarch64=('f4672cb77614294b566170dcb97f7396db6bb0720a869b59e31fe4cdf49b6382529dfa766ecfb34322fb9e03023fe51a29a3ce1da0c1c71f373e60998d74f656')

package() {
	cd "${srcdir}"

    install -Dm755 "dist_linux"*"/$_pkgname"                        "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "dist_linux"*"/${_pkgname}-sensor"               "${pkgdir}/usr/bin/${_pkgname}-sensor"
}
