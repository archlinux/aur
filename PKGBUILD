# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=evid
pkgver=0.0.1
pkgrel=1
pkgdesc="screen recorder for X with a minimal interface with support for gifs and mp4"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libx11' 'libxfixes' 'libnotify' 'ffmpeg')
url="https://github.com/maquinas07/evid"

source=($pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('2dde0e86de668e0bfda858dbfe84ada388e51997e2f9a1cbdc2f25cca2826ab5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make PREFIX="${pkgdir}/usr/" install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
