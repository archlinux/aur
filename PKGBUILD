# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Eric Forgeot http://anamnese.online.fr

pkgname=abcpp
pkgver=1.4.5
pkgrel=2
pkgdesc="A simple yet powerful preprocessor designed for, but not limited to, ABC music files"
url="http://abcplus.sourceforge.net"
license=('GPL')
source=("https://sourceforge.net/projects/abcplus/files/${pkgname}/${pkgname}-${pkgver}.tar.gz")
arch=('i686' 'x86_64')
sha256sums=('c45a7c3152233dd42970ac146f0e795cd1c6602bbcd1367abcf9cc65ae611183')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # program
  install -Dm755 abcpp -t "${pkgdir}/usr/bin"
  # abc include files
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -m644 *.abp "${pkgdir}/usr/share/${pkgname}"
  # documentation & examples
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/examples"
  install -m644 docs/* -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 examples/* "${pkgdir}/usr/share/doc/${pkgname}/examples"
}
