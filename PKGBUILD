# Maintainer: Ns2Kracy <2220496937@qq.com>
# Maintainer: CorrectRoadH <correctroadh@gmail.com>
pkgname=casaos-cli
pkgver=0.4.2
pkgrel=1
pkgdesc='A command-line tool to interact with CasaOS for testing and diagnosing purpose'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/IceWhaleTech/CasaOS-CLI/releases/tag/v0.4.2'
license=('APACHE')
groups=('casaos')

source_x86_64=(
    ${url}/releases/download/v${pkgver}/linux-amd64-${pkgname}-v${pkgver}.tar.gz
    )
source_aarch64=(
    ${url}/releases/download/v${pkgver}/linux-arm64-${pkgname}-v${pkgver}.tar.gz
    )
source_armv7h=(
    ${url}/releases/download/v${pkgver}/linux-arm-7-${pkgname}-v${pkgver}.tar.gz
    )

sha256sums=(SKIP)
package() {
    _sysdir="${srcdir}/build/sysroot"
    install -Dm755 "${_sysdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${_sysdir}/etc/bash_completion.d/${pkgname}-completion" "${pkgdir}/etc/bash_completion.d/${pkgname}-completion"
}
