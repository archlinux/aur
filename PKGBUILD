#Maintainer: vyzu <vyzu AT vyzu DOT net>
pkgname=qbit-manage-bin
_pkgname=qbit-manage
pkgver=4.7.0
pkgrel=1
pkgdesc='Manage tedious tasks in qBittorrent and automate them.'
arch=('x86_64'
	# 'aarch64'
)
url=https://github.com/StuffAnThings/qbit_manage
license=('MIT')
provides=('qbit-manage')
conflicts=('qbit-manage')
source=('qbit-manage.service'
		'qbit-manage.sysusers'
		'qbit-manage.tmpfiles'
		'config.yml.sample'
)
source_x86_64=("${_pkgname}-linux-amd64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
# source_aarch64=("${_pkgname}-linux-arm64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")

package() {
	install -Dm755 "${srcdir}/${_pkgname}-linux-amd64" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 qbit-manage.service "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
	install -Dm644 qbit-manage.sysusers "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -Dm644 qbit-manage.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
	install -Dm644 config.yml.sample "${pkgdir}/etc/${_pkgname}/config.yml"
}
sha256sums=('4552d6e12ef2db4496f2907bd83c8630ab28556c54c586d1cb7caba2caa3c0eb'
            'be5820784ec79570655fa50ae2dad91e947a860d47d8dc52a0a5b19435101519'
            'eff592aea90911f8775aacd87f3e2aaf255ecc7dda3e40d6f681da89e9948129'
            'f049fed5baca39e103eac52452c52edf6f691c0bc66b184f0ee32e12a531bca1')
sha256sums_x86_64=('138c73f62f42ca2da46c81e332f0fd2643594d4440d7e1142d096135cda135b9')
# sha256sums_aarch64=('c0244832dbc93669540f52553b152057947f53bc2cfd8f86fa429128f25b8981')
