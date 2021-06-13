# Maintainer: A. Husen <hi@husen.id>
pkgname=docker-slim-bin
_pkgname=docker-slim
pkgver=1.36.0
pkgrel=1
pkgdesc="Don't change anything in your Docker container image and minify it by up to 30x (and for compiled languages even more) making it secure too! (free and open source)"
arch=('x86_64' 'aarch64')
url="https://github.com/docker-slim/docker-slim"
license=('Apache')
provides=('docker-slim' 'docker-slim-sensor')
conflicts=('docker-slim')
source=("${url}/raw/master/README.md"
        "${url}/raw/master/LICENSE")
source_x86_64=("$_pkgname-$pkgver.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux.tar.gz")
source_aarch64=("$_pkgname-$pkgver.tar.gz::https://downloads.dockerslim.com/releases/${pkgver}/dist_linux_arm64.tar.gz")
sha512sums=('67e2cc807449082262ec0b09831f67587d5f29735fb5e09164384213ad7769c1bc540b2c1a17040158ae8dbbe767b377326879dc148eb2aa19e04159b740c4a2'
            '6deb837dc1a7059bf3be7fd04ea2900c34d72f1cabd10109abf93fa60874d9f0c00a82fa4f98bfe1d4fc1b6b0b000b6c9d6b8f410104e0afdf7d658328ecca46')
sha512sums_x86_64=('c5b3484c0a0670009450d1d7e74359fb2b22b4242282659243dfb13d463137586ace9294865a8fe0b9465e5cfa81dcd09c40b4b35bfdafff5fe1ca25838c23ad')
sha512sums_aarch64=('c5b3484c0a0670009450d1d7e74359fb2b22b4242282659243dfb13d463137586ace9294865a8fe0b9465e5cfa81dcd09c40b4b35bfdafff5fe1ca25838c23ad')

package() {
	cd "${srcdir}"

    install -Dm755 "dist_linux"*"/$_pkgname"                        "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "dist_linux"*"/${_pkgname}-sensor"               "${pkgdir}/usr/bin/${_pkgname}-sensor"

    install -Dm644 "README.md"                                      "$pkgdir/usr/share/doc/${_pkgname}/README.md"

    install -Dm644 "LICENSE"                                        "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
