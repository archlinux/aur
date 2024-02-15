# Maintainer: A. Husen <hi@husen.id>
pkgname=docker-slim-bin
_pkgname=docker-slim
pkgver=1.40.11
pkgrel=1
pkgdesc="Don't change anything in your Docker container image and minify it by up to 30x (and for compiled languages even more) making it secure too! (free and open source)"
arch=('x86_64' 'aarch64')
url="https://github.com/docker-slim/docker-slim"
license=('Apache')
provides=('docker-slim' 'docker-slim-sensor')
conflicts=('docker-slim')
source_x86_64=("$_pkgname-$pkgver.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux.tar.gz")
source_aarch64=("$_pkgname-$pkgver.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux_arm64.tar.gz")
sha512sums_x86_64=('2180cb259a65e3d2fd22204be5aff596281f500cc57519288bb37ea7dc0b8ec33f6044f730a074e4ab93fb8b93b0d2c607cff079e7af3f1e44c0be73dab1f69a')
sha512sums_aarch64=('884b43bbcec43eca2623fe434717a8a0ea54e558b032d98c1efb9dd1c9f4fa9f729617018a1abcc0c658afeefa4a4abd90a0f53a9e7e6297f68091e9d630a5dd')

package() {
	cd "${srcdir}"
    install -Dm755 "dist_linux"*"/$_pkgname"                        "${pkgdir}/usr/bin/${_pkgname}"
#    install -Dm755 "dist_linux"*"/${_pkgname}-sensor"               "${pkgdir}/usr/bin/${_pkgname}-sensor"
}
