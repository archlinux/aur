# Maintainer: A. Husen <hi@husen.id>
pkgname=docker-slim-bin
_pkgname=docker-slim
pkgver=1.37.5
pkgrel=1
pkgdesc="Don't change anything in your Docker container image and minify it by up to 30x (and for compiled languages even more) making it secure too! (free and open source)"
arch=('x86_64' 'aarch64')
url="https://github.com/docker-slim/docker-slim"
license=('Apache')
provides=('docker-slim' 'docker-slim-sensor')
conflicts=('docker-slim')
source_x86_64=("$_pkgname-$pkgver.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux.tar.gz")
source_aarch64=("$_pkgname-$pkgver.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux_arm64.tar.gz")
sha512sums_x86_64=('37f18f54af6fbe41e4783ec474547acb87af70f7bc5ca42060539fd2c2bd65c55515aa009d4589fbeba0b910a9879e3b35cf291d88d533f75aacee71a491ebd4')
sha512sums_aarch64=('37f18f54af6fbe41e4783ec474547acb87af70f7bc5ca42060539fd2c2bd65c55515aa009d4589fbeba0b910a9879e3b35cf291d88d533f75aacee71a491ebd4')

package() {
	cd "${srcdir}"

    install -Dm755 "dist_linux"*"/$_pkgname"                        "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "dist_linux"*"/${_pkgname}-sensor"               "${pkgdir}/usr/bin/${_pkgname}-sensor"
}
