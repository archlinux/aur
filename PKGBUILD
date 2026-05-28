pkgname=klavaro-bin
_pkgname=klavaro
pkgver=1.0.5
pkgrel=1
pkgdesc='Print your current xkb_layout in Sway'
arch=('x86_64' 'aarch64')
url='https://github.com/Fierthraix/klavaro'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
optdepends=('sway: Sway IPC socket provider' 'i3-wm: i3 IPC socket provider')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9a397d4e4ad0f7198b2c20a55a8bbbb22c3baa00b4f6ac3731bc6443780029c0')
sha256sums_aarch64=('f088c93c70a2b929416b7ae86fa25184a857a9de93046db56971d39944cc69b8')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
