# Maintainer: Amin Vakil <info AT aminvakil DOT com>
pkgname=docker-bench-security
pkgver=1.3.5
pkgrel=2
pkgdesc="Check common best-practices around deploying Docker container"
arch=('any')
url="https://github.com/docker/docker-bench-security"
license=('Apache')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}-exec.sh")
depends=(docker)
sha256sums=('70b7496440acbee7c80700b048a6fe1272467e2aeec3a6b6b2b46329d9fdc370'
            'cd14edcb0f5c5cf05a51ba6e01c9a01d45e88738fda2ae56e31dc1f8af29025d')

package() {
    install -dm 755 "${pkgdir}/opt/${pkgname}"
    install -Dm 755 ../"${pkgname}"-exec.sh "${pkgdir}/usr/bin/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/"* "${pkgdir}/opt/${pkgname}"
}
