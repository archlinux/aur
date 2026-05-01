# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=pumba
pkgname=pumba-bin
pkgver=1.1.6
pkgrel=1
pkgdesc="Chaos testing, network emulation and stress testing tool for containers "
arch=('aarch64' 'x86_64')
url="https://github.com/alexei-led/pumba"
license=('Apache-2.0')
conflicts=('pumba')
provides=('pumba')

source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64::$url/releases/download/$pkgver/${_pkgname}_linux_amd64")
source_aarch64=("${_pkgname}-${pkgver}linux-aarch64::$url/releases/download/$pkgver/${_pkgname}_linux_arm64")

sha256sums_aarch64=('59d5f3afcf7b2a98f54de8a351b9c8d948bb586335fd2e7d575546e983d9dd04')
sha256sums_x86_64=('7cae7add0e09691de6cddc867791b3aaa5adfd40cf37d5d524269535ad74912d')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${pkgver}-linux-${CARCH} ${pkgdir}/usr/bin/${_pkgname}
}
