# Maintainer: A. Husen <hi@husen.id>
pkgname=docker-slim-bin
_pkgname=docker-slim
pkgver=1.41.5
pkgrel=2
pkgdesc="Don't change anything in your Docker container image and minify it by up to 30x (and for compiled languages even more) making it secure too! (free and open source)"
arch=('x86_64' 'aarch64')
url="https://github.com/docker-slim/docker-slim"
license=('Apache')
provides=('docker-slim' 'docker-slim-sensor')
conflicts=('docker-slim')
source_x86_64=("$_pkgname-$pkgver.tar.gz::https://github.com/mintoolkit/mint/releases/download/${pkgver}/dist_linux.tar.gz")
source_aarch64=("$_pkgname-$pkgver.tar.gz::https://github.com/mintoolkit/mint/releases/download/${pkgver}/dist_linux_arm64.tar.gz")
sha512sums_x86_64=('43b0407cae73e3284f4ae796113e4acd38ef287ed5560d1daaf98d7ee59a13e510c35cc399af63ac76f6bc77294df7c780c8c3ce4aae12e24d8a573267fe5622')
sha512sums_aarch64=('c22c12557a28147f2c07dc9581452567f1d96767d5221b009feb97e80924fe2baf33dfc117ca42c07ee8c26339d6c3aa10223dec68ea1175f08bad9c7f106b5d')

package() {
	cd "${srcdir}"
    install -Dm755 "dist_linux"*"/${_pkgname}"                 "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "dist_linux"*"/mint-sensor"                 "${pkgdir}/usr/bin/mint-sensor"
    install -Dm755 "dist_linux"*"/mint"                        "${pkgdir}/usr/bin/mint"
    install -Dm755 "dist_linux"*"/slim"                        "${pkgdir}/usr/bin/slim"
    }
