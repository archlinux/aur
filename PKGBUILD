# Maintainer: Amin Vakil <info AT aminvakil DOT com>
pkgname=docker-bench-security
pkgver=1.6.1
pkgrel=1
pkgdesc="Check common best-practices around deploying Docker container"
arch=('any')
url="https://github.com/docker/docker-bench-security"
license=('Apache')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}-exec.sh")
depends=(docker)
sha256sums=('736111db91d5c11808e015d3980c8cb199dce4d03bf35d897e23b7d87cc25844'
            'cd14edcb0f5c5cf05a51ba6e01c9a01d45e88738fda2ae56e31dc1f8af29025d')

package() {
    install -dm 755 "${pkgdir}/opt/${pkgname}"
    install -Dm 755 ../"${pkgname}"-exec.sh "${pkgdir}/usr/bin/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/"* "${pkgdir}/opt/${pkgname}"
}
