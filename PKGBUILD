# Maintainer: Ns2Kracy <2220496937@qq.com>
pkgname=casaos-message-bus
pkgver=0.4.0
pkgrel=1
pkgdesc="Message bus accepts events and actions from various sources and delivers them to subscribers."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/IceWhaleTech/CasaOS-MessageBus"
license=('APACHE')
groups=('casaos')
backup=('etc/casaos/message-bus.conf')
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
sha256sums_x86_64=(
    84c9678bfe6da66a2e8919f523d99bcf8e20adcfd15fdbce29b1e3c38899f013
    e00dd554bf103412393e968ca035a2ec7f6d80b2b4251e799faa7540bb0f2ab1
)
sha256sums_aarch64=(
    8f34045f90792c52fe5568eb284bd6870a6f6c9e8944396ce3e5876ba08c4a88
    a13aab841ab2c3cb1ac3a599d45c101a294e87519163287626a6501e510c892a
)
sha256sums_armv7h=(
    48a3f0af57abdae63e7866eb60985458fef6960603d9eee01db3605d50ca705f 
    4013f27458646af36fcc7e50d2a0dc7f2dbee84b982773bb91f402e59a8ed468
)
package() {
	_sysdir="${srcdir}/build/sysroot"
	_name="${pkgname#*-}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}-migration-tool" "${pkgdir}/usr/bin/${pkgname}-migration-tool"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.conf.sample" "${pkgdir}/etc/casaos/${_name}.conf"
	install -Dm644 "${_sysdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
