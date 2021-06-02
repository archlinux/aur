# Maintainer: A. Husen <hi@husen.id>
pkgname=docker-slim-bin
_pkgname=docker-slim
pkgver=1.35.1
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
sha512sums=('142e02f60f6a0b0a85aa33db0de488df40cf2b5f319e319f5a6b68631891ed1bca9381a159b185a15e6dc04db1113972bbd2c2fcd7a0201f494af5a7674464cb'
	    '6deb837dc1a7059bf3be7fd04ea2900c34d72f1cabd10109abf93fa60874d9f0c00a82fa4f98bfe1d4fc1b6b0b000b6c9d6b8f410104e0afdf7d658328ecca46')
sha512sums_x86_64=('487eaaa117cd382d388bca29cb4ed16dd7ffdd00d342af2cca16c6c8c60d8af6c6de4b86c4838c5f452f36907221ee3c7c1a1864ff6f9fb5cd12466da5480eb6')
sha512sums_aarch64=('3d17602224c7558cf641b7496120854a1204c8a0ca0f203b9fa0b50378949bcb915720a4a51f59b79f8481e5c919d3b02698d2a6df9d2dec24289b730bca943a')

package() {
	cd "${srcdir}"

    install -Dm755 "dist_linux"*"/$_pkgname"                        "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "dist_linux"*"/${_pkgname}-sensor"               "${pkgdir}/usr/bin/${_pkgname}-sensor"

    install -Dm644 "README.md"                                      "$pkgdir/usr/share/doc/${_pkgname}/README.md"

    install -Dm644 "LICENSE"                                        "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
