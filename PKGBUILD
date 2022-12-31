# Maintainer: Ns2Kracy <2220496937@qq.com>
pkgname=casaos-user-service
pkgver=0.4.0
pkgrel=1
pkgdesc="Provides user management functionalities to CasaOS."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/IceWhaleTech/CasaOS-UserService"
license=('APACHE')
groups=('casaos')
provides=('casaos')
backup=('etc/casaos/user-service.conf')
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
    64bb6a6b465f2f04489f55251b7bb62c29360f25505d6eda377a12c584ce644d
    3b4baf21b8c25cff66a6145f93095343dca344993f8753df2e677c56d83ee0d2
    )
sha256sums_armv7h=(
    6ef1a10fa156dfaa6c3055a7361e419d6fe165e28b3f67c945761f99c1658841
    afeaffe956afd6a9a92f9769c5cde58f78165ac3ea9359d867a7f74cdd89e9cd
    )
sha256sums_aarch64=(
    b901d1c357263cc353a08a52ea5cfb481c5d0b8776df63f65309889032033e0f
    c59f6ab85430cf7475919aaaa49523a75815aee434e141c6c921a09949074c3e
    )
package() {
    _sysdir="${srcdir}/build/sysroot"
	_name="${pkgname#*-}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}-migration-tool" "${pkgdir}/usr/bin/${pkgname}-migration-tool"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.conf.sample" "${pkgdir}/etc/casaos/${_name}.conf"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.conf.sample" "${pkgdir}/etc/casaos/${_name}.conf.sample"
	install -Dm644 "${_sysdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
