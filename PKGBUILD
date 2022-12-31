# Maintainer: Ns2Kracy <2220496937@qq.com>
pkgname=casaos-gateway
pkgver=0.4.0
pkgrel=1
pkgdesc="CasaOS Gateway is a dynamic API gateway service that can be used to expose APIs from different other HTTP based services."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/IceWhaleTech/CasaOS-Gateway"
license=('APACHE')
backup=('etc/casaos/gateway.ini')
groups=('casaos')
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
	92f80dfd6c648ac96c65a9376f99329888efcc215ac5a65c2c8ad31b235ef94a
    cd2c6dc6601e2ad5f7fda38c79052e228affcd0f73bb0f41ce7175a1e5ef2313
)
sha256sums_aarch64=(
	11253b331bb703b4f307c0780a795b2eeb7dbd526f23644565bbc5a43c55aacb
    266bfdcc533881bf55ad54b8d87368f555e1eac87e0eb80f092cf1a8cfd46078
)
sha256sums_armv7h=(
	eb211dabd94ca6cb66c7396c7669f3ff6be9bdd574e37403d30271cc02ec2278
    a4853dc3414665bbf83d397272cca794a25a6cf42ae8a4e9753305b8c30a866e
)
package() {
	_sysdir="${srcdir}/build/sysroot"
	_name="${pkgname#*-}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${_sysdir}/usr/bin/${pkgname}-migration-tool" "${pkgdir}/usr/bin/${pkgname}-migration-tool"
	install -Dm644 "${_sysdir}/etc/casaos/${_name}.ini.sample" "${pkgdir}/etc/casaos/${_name}.ini"
	install -Dm644 "${_sysdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
