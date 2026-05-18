pkgname=pingall-bin
_pkgname=pingall
pkgver=2.1.4
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
sha256sums_x86_64=('87ed79d18003a7e64c153e6256bb0c96cf95aa3a25ba3f3e28c7c3f2a7e26754')
sha256sums_aarch64=('c3f6d1c618a3fad71a192b2e7e7b06c8eef593acf81df0491b595b3759d692de')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
