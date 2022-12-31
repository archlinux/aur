# Maintainer: Ns2Kracy <2220496937@qq.com>
pkgname=casaos-cli
pkgver=0.4.0
pkgrel=1
pkgdesc='A command-line tool to interact with CasaOS for testing and diagnosing purpose'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/IceWhaleTech/CasaOS-CLI"
license=('APACHE')
groups=('casaos')
provides=('casaos')
source_x86_64=(
    ${url}/releases/download/v${pkgver}/linux-amd64-${pkgname}-v${pkgver}.tar.gz
    )
source_aarch64=(
    ${url}/releases/download/v${pkgver}/linux-arm64-${pkgname}-v${pkgver}.tar.gz
    )
source_armv7h=(
    ${url}/releases/download/v${pkgver}/linux-arm-7-${pkgname}-v${pkgver}.tar.gz
    )
sha256sums_x86_64=('98e2c056649120da963ee62a52056ec85ebbdaecfd2e339962ec39a94aa21d0c')
sha256sums_armv7h=('44a79eeb0374ff9ec9c00cc5193adc7e897164058b82135a1a9b39a072575eaa')
sha256sums_aarch64=('5b145a5fe78f7ad1c285a2e9fa892323b5ce9c9e4aaea3ecd0887f694d04bb36')
package() {
    install -Dm755 "${srcdir}/build/sysroot/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/build/sysroot/etc/bash_completion.d/${pkgname}-completion" "${pkgdir}/etc/bash_completion.d/${pkgname}-completion"
}

