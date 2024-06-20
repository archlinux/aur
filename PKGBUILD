# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=txt2epub
pkgver=0.0.4
pkgrel=2
pkgdesc='Convert one or more plain text files into an EPUB document'
arch=('any')
makedepends=('pcre')
url='https://github.com/kevinboone/txt2epub'
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e526660dcfdb8e454be6c6b0893dc8212b70b26a5861dbaf4852cf7f06ae43ba')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "man1/${pkgname}.1"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
}

# vim: ts=2 sw=2 et:
