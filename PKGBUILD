# Maintainer: Ns2Kracy <2220496937@qq.com>
# Maintainer: CorrectRoadH <correctroadh@gmail.com>
pkgname=casaos-gateway
pkgver=0.4.2
pkgrel=1
pkgdesc='CasaOS Gateway is a dynamic API gateway service that can be used to expose APIs from different other HTTP based services.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/IceWhaleTech/CasaOS-Gateway'
license=('APACHE')
groups=('casaos')
backup=('etc/casaos/gateway.ini')

source_x86_64=(
	${url}/releases/download/v${pkgver}/linux-amd64-${pkgname}-v${pkgver}.tar.gz
    ${url}/releases/download/v${pkgver}/linux-amd64-${pkgname}-migration-tool-v${pkgver}.tar.gz
)
source_aarch64=(
    ${url}/releases/download/v${pkgver}/linux-arm64-${pkgname}-v${pkgver}.tar.gz
    ${url}/releases/download/v${pkgver}/linux-arm64-${pkgname}-migration-tool-v${pkgver}.tar.gz
)
source_armv7h=(
	${url}/releases/download/v${pkgver}/linux-arm-7-${pkgname}-v${pkgver}.tar.gz
    ${url}/releases/download/v${pkgver}/linux-arm-7-${pkgname}-migration-tool-v${pkgver}.tar.gz
)

sha256sums_x86_64=(SKIP SKIP)
sha256sums_aarch64=(SKIP SKIP)
sha256sums_armv7h=(SKIP SKIP)
package() {
	_sysdir="${srcdir}/build/sysroot"
	_name="${pkgname#*-}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}-migration-tool" "${pkgdir}/usr/bin/${pkgname}-migration-tool"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.ini.sample" "${pkgdir}/etc/casaos/${_name}.ini"
	install -Dm644 "${_sysdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
