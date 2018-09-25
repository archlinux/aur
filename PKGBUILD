# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-oathkeeper'
pkgname="${_pkgname}-bin"
pkgver=1.0.0_beta.9
pkgrel=1
pkgdesc="A cloud native Identity & Access Proxy (IAP) which authenticates and authorizes incoming HTTP requests."
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/oathkeeper/releases/download/v${pkgver//_/-}/oathkeeper-linux-amd64")
sha256sums=('d6abef296f24ff25f50f5ba6cffb3cc73aa00af8e7a724e3652128e65170ee75')

package() {
    mv "${srcdir}/oathkeeper-linux-amd64" "${srcdir}/oathkeeper"
    install -m755 -D "${srcdir}/oathkeeper" "${pkgdir}/usr/bin/oathkeeper"
}
