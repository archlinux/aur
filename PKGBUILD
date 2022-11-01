# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: quellen <lodgerz@gmail.com>

pkgname='epub2txt'
_pkgname="${pkgname}2"
pkgver=2.06
pkgrel=2
pkgdesc='Extract text from EPUB documents'
arch=('x86_64')
url='https://github.com/kevinboone/epub2txt2'
license=('GPL3')
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d45ad76a1adca6b62bf0ccbc1aed3a527c3bc2a790516e8de82cc1e6545548b6')

build() {
  make -C "${_pkgname}-${pkgver}"
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "man1/${pkgname}.1"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
}

# vim: ts=2 sw=2 et:
