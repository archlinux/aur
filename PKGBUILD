# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds

_pkgname=notes
pkgname=bash-notes
pkgver=1.4.0
pkgrel=1
pkgdesc="Simple delightful note taking, with more unix and less lock-in."
arch=('any')
url="https://github.com/pimterry/notes"
license=('MIT')
depends=('bash')
conflicts=('notes')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0421361d95dd451668101022fac65a18f26814b0d585687a38e162fd3ebba6c2')

package() {
  cd "${_pkgname}-${pkgver}"
  install -D ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 ${_pkgname}.bash_completion "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 ${_pkgname}.fish "${pkgdir}/usr/share/fish/completions/${_pkgname}.fish"
  install -Dm644 ${_pkgname}.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 config "${pkgdir}/usr/share/${_pkgname}/config.example"
}
