# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-keto'
pkgname="${_pkgname}-bin"
pkgver=1.0.0_beta.9
pkgrel=1
pkgdesc="A cloud native access control server capable of solving complex use cases (multi-tenant, attribute-based access control, ...) with access control policies (IAM Policies). "
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/keto/releases/download/v${pkgver//_/-}/keto-linux-amd64")
sha256sums=('5d5805888df10047cccbcd29003f0d626c5dc2d12f981d022cd168840e947cdb')

package() {
    mv "${srcdir}/keto-linux-amd64" "${srcdir}/keto"
    install -m755 -D "${srcdir}/keto" "${pkgdir}/usr/bin/keto"
}
