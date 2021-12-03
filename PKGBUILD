# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=pumba
pkgname=pumba-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Chaos testing, network emulation and stress testing tool for containers "
arch=('aarch64' 'x86_64')
url="https://github.com/alexei-led/pumba"
license=('Apache')
conflicts=('pumba')
provides=('pumba')

source_x86_64=("${_pkgname}-linux-x86_64::$url/releases/download/$pkgver/${_pkgname}_linux_amd64")
source_aarch64=("${_pkgname}-linux-aarch64::$url/releases/download/$pkgver/${_pkgname}_linux_arm64")

sha256sums_aarch64=('07145aa3365aa360cfbf314fd5c5d76d6b3ccff1d82fd5f9bfcff8a09d0da104')
sha256sums_x86_64=('7ce9e018242900c97430d9fba578b3a379877cec905b0455f6413310f7d586fc')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/${_pkgname}-linux-${CARCH} ${pkgdir}/usr/bin/${_pkgname}
}

