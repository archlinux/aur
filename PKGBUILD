# Maintainer: imp0 <jan <(@)> siteworld <(.)> be>
_pkgname=siji
pkgname="neo${_pkgname}"
pkgver=1.0
pkgrel=1
pkgdesc='A fixed and maintained Siji.'
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
arch=('any')
url="https://github.com/begss/${pkgname}"
license=('GPL2')
makedepends=('xorg-bdftopcf' 'python3')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('df686d9c250ed4a76d01b9b401f9e214fb640055a25a26824c0d0b19be64cbcda4cbba89715b5bd92802a2f9e3bad158c8541d84d566c79ec9f13eb539ae6648')

build() {
  cd "${pkgname}-${pkgver}"
  make build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/misc" "${_pkgname}.pcf" "${_pkgname}.otb"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}

# vim:set ts=2 sw=2 et:
