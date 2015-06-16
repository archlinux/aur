# Maintainer: Brandon Mulcahy <brandon@jangler.info>
pkgname=mariopants
pkgver=1.1
pkgrel=3
pkgdesc='Music editor based on SNES Mario Paint.'
arch=('i686' 'x86_64')
url="http://rainwarrior.ca/projects/nes/mariopants.html"
license=('unknown')
depends=('sdl' 'tk')
source=("http://rainwarrior.ca/projects/nes/mariopants11src.tar.gz")
sha256sums=('6c9772b71e421c4860232111fb84c6ef4fac03899df5c080d658a5dd516d987b')

build() {
  cd "${srcdir}"
  make mariopants
}

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 ${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
