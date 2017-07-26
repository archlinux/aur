# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=faac
pkgver=1.29.3
pkgrel=1
pkgdesc="An AAC audio encoder"
arch=('i686' 'x86_64')
url="http://www.audiocoding.com/"
license=('GPL' 'custom')
depends=('libmp4v2')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/libfaac/kiss_fft/COPYING \
    "${pkgdir}"/usr/share/licenses/faac/LICENSE
}
md5sums=('20108ccff238813937ae1fec6eb80e7c')
