pkgname=pingall-bin
_pkgname=pingall
pkgver=2.1.5
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
sha256sums_x86_64=('06846713e227bbf6c5956c7446873ff4beac7ed9c321eda3fd1367d827a999bb')
sha256sums_aarch64=('4a8989ad1c3808cdf8e31f17be13a86b27940cbf3221dd3e7944645c76366e92')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
