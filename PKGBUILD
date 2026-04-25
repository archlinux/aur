# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=pumba
pkgname=pumba-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Chaos testing, network emulation and stress testing tool for containers "
arch=('aarch64' 'x86_64')
url="https://github.com/alexei-led/pumba"
license=('Apache-2.0')
conflicts=('pumba')
provides=('pumba')

source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64::$url/releases/download/$pkgver/${_pkgname}_linux_amd64")
source_aarch64=("${_pkgname}-${pkgver}linux-aarch64::$url/releases/download/$pkgver/${_pkgname}_linux_arm64")

sha256sums_aarch64=('6cf039a7a5e56136e71b0ffbe2cb9e3c3bdc170b15d2e17d0a61e7a0113758ca')
sha256sums_x86_64=('b50463e6f641c5515748abafa3cbd15781e07ac6dba4730e6c68468d60ac25f4')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-${pkgver}-linux-${CARCH} ${pkgdir}/usr/bin/${_pkgname}
}
