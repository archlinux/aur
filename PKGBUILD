pkgname=pingall-bin
_pkgname=pingall
pkgver=2.1.7
pkgrel=1
pkgdesc='Ping everything you can reach'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/pingall'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'iputils')
optdepends=('avahi: hostname resolution with avahi-resolve')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('503483d38d5cc01ef798197fae38b45d11bb68fe112920840af8aeb3ca669bb1')
sha256sums_aarch64=('90e1e815c7c91e8bd136faeb9e78e36b5dd11518fa0aa1ccad63c1c0ccf33ecc')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
