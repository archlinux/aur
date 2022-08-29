# Maintainer: A. Husen <hi@husen.id>
pkgname=docker-slim-bin
_pkgname=docker-slim
pkgver=1.38.0
pkgrel=1
pkgdesc="Don't change anything in your Docker container image and minify it by up to 30x (and for compiled languages even more) making it secure too! (free and open source)"
arch=('x86_64' 'aarch64')
url="https://github.com/docker-slim/docker-slim"
license=('Apache')
provides=('docker-slim' 'docker-slim-sensor')
conflicts=('docker-slim')
source_x86_64=("$_pkgname-$pkgver.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux.tar.gz")
source_aarch64=("$_pkgname-$pkgver.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux_arm64.tar.gz")
sha512sums_x86_64=('6f6bef03d896d92649f5612cb517a08a4295b7f2af287ccde43fffd396a7ba581388b2856ea939e65b4c1b00d5b86aff856b0e841277a3524065e8b7cc092fe4')
sha512sums_aarch64=('6f6bef03d896d92649f5612cb517a08a4295b7f2af287ccde43fffd396a7ba581388b2856ea939e65b4c1b00d5b86aff856b0e841277a3524065e8b7cc092fe4')

package() {
	cd "${srcdir}"

    install -Dm755 "dist_linux"*"/$_pkgname"                        "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "dist_linux"*"/${_pkgname}-sensor"               "${pkgdir}/usr/bin/${_pkgname}-sensor"
}
