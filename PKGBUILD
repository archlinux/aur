# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

pkgname='ipfs-cluster-hardening'
pkgver=1.0
pkgrel=1
pkgdesc='systemd hardening drop-in for IPFS Cluster'
arch=('any')
url='https://github.com/RubenKelevra/ipfs-cluster-hardening'
license=('CC0-1.0')
depends=('ipfs-cluster-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('8b7a539cb462d53b06632a7ab4b5927945f8639b8475e2838dc2f5ac5512543526b69458d2aaf76a02271f38a0aa87b514f1c1ad8a535cc31ca750b28412ddd6')

package() {
	cd -- "${pkgname}-${pkgver}" || return 1

	install -Dm644 'conf/20-hardening.conf' "${pkgdir}/usr/lib/systemd/system/ipfs-cluster@.service.d/20-hardening.conf"
	install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
