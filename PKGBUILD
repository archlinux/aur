# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='oneshot'
pkgname="${_pkgname}-bin"
pkgver=1.2.0
pkgrel=1
pkgdesc='Easily transfer files to and from your terminal and any browser'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/raphaelreyna/oneshot'
license=('MIT')
provides=("${_pkgname}")

source_x86_64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}.linux-x86_64.tar.gz")
source_armv7h=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}.linux-arm.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}.linux-arm64.tar.gz")

sha256sums_x86_64=('eea35b2ff2f166c397ccf754a2b0af9b32793f8f5553473ded0109d579bec2ed')
sha256sums_armv7h=('7c9a7abc3ec2ca29ee07b4c98f67ffd63fa287226a3ea699fa0392b2160f097f')
sha256sums_aarch64=('2dfe8f5ffbe0197e18c09ae9d40220403ee61ca0f8de4e66d83aa3cdf1ce496a')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "${_pkgname}.1"
}

# vim: ts=2 sw=2 et:
