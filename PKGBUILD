# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname=cauralho-git
_pkgname=cauralho
pkgver=r8.894c896
pkgrel=1
pkgdesc="A small tool to help with updating AUR packages installed in the system."
arch=("any")
url="https://github.com/qrwteyrutiyoup/cauralho"
license=("Apache")
depends=('dialog' 'curl' 'jq' 'sed' 'bash>=4.0.0')
makedepends=('git')
provides=('cauralho')
conflicts=('cauralho')
source=("${_pkgname}"::git+https://github.com/qrwteyrutiyoup/cauralho.git)
md5sums=('SKIP')
backup=('etc/cauralho.conf')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"

  install -Dm 755 "${srcdir}/${_pkgname}/cauralho" "${pkgdir}/usr/bin/cauralho"
  install -Dm 644 "${srcdir}/${_pkgname}/cauralho.conf.sample" "${pkgdir}/etc/cauralho.conf"
  install -Dm 644 "${srcdir}/${_pkgname}/cauralho.conf.sample" "${pkgdir}/etc/cauralho.conf.sample"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
