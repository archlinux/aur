# Maintainer: Christian Rebischke <Chris.Rebischke[at]archlinux[dot]org>
_pkgname=awesome-terminal-fonts
pkgname="${_pkgname}"
pkgver=1.0.0
pkgrel=4
pkgdesc="fonts/icons for powerlines"
arch=('any')
url="https://github.com/gabrielelana/awesome-terminal-fonts"
license=('MIT')
depends=('fontconfig')
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/gabrielelana/awesome-terminal-fonts/archive/v${pkgver}.tar.gz")
sha512sums=('ec3a7dde0b2421fe3af8a793ca24d839e5db57193e2ac3287501621e3504b7ff8d9da17688ab7fd0e7577d28a1cfb8eead110d0d80a721461450ae4cd54a8f58')


package() {
  install -d "${pkgdir}/usr/share/fonts/${_pkgname}"
  install -d "${pkgdir}/etc/fonts/conf.avail"
  install -d -m 0644 "${pkgdir}/usr/share/doc/${_pkgname}"
  install -m 0644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
  install -m 0644 "${srcdir}/${_pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  install -m 0644 * "${pkgdir}/usr/share/fonts/${_pkgname}/"
  install -m 0644 "${srcdir}/${_pkgname}-${pkgver}/config/10-symbols.conf" "${pkgdir}/etc/fonts/conf.avail"
}

# vim:set et sw=2 ts=2 tw=79:
