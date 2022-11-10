# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=evid
pkgver=0.0.2
pkgrel=1
pkgdesc="screen recorder for X with a minimal interface with support for gifs and mp4"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libx11' 'libxfixes' 'libnotify' 'ffmpeg')
url="https://github.com/maquinas07/evid"

source=($pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('db61d557bb59f966ae132523232569f3509e12865453a888dd2bda75783627e4')

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
