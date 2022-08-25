# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=check_mk-agent
pkgver=2.1.0p10
pkgrel=1
pkgdesc='Agent to send information to a Check_MK server'
arch=(any)
url='https://mathias-kettner.de/'
license=('GPLv2')
makedepends=('git')
source=("${pkgname}-check_mk_agent.linux-${pkgver}::https://raw.githubusercontent.com/tribe29/checkmk/v${pkgver}/agents/check_mk_agent.linux"
        "${pkgname}-check_mk_caching_agent.linux-${pkgver}::https://raw.githubusercontent.com/tribe29/checkmk/v${pkgver}/agents/check_mk_caching_agent.linux")
sha256sums=('7ca58932931af335129adcedd7059f9150967ad20b3e8c3569265abd73b62cb5'
            'c29a519a75fec898d8c748da16f2cdecff210c11872c206873aa1374e793f87b')

package() {
	ls -l
	install -D -m0755 ${pkgname}-check_mk_agent.linux-${pkgver} "${pkgdir}"/usr/bin/check_mk_agent
	install -D -m0755 ${pkgname}-check_mk_caching_agent.linux-${pkgver} "${pkgdir}"/usr/bin/check_mk_caching_agent

	install -d -m0755 "${pkgdir}"/var/lib/check_mk_agent/{cache,job,spool,local,plugins}
}
