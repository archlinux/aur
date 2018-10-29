# Maintainer: zoe <chp321 AT gmail DOT com>
pkgname=shorten
pkgver=3.6.1
pkgrel=3
pkgdesc="a fast, low complexity waveform coder (audio compressor) which uses a lossless compression scheme, with support for seek tables, superior to that of mp3 "
arch=('x86_64')
url="http://shnutils.freeshell.org/${pkgname}/"
license=('custom')
source=("http://shnutils.freeshell.org/${pkgname}/dist/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('fb59c16fcedc4f4865d277f6e45866a7')
depends=('gcc-libs')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
