# maintainer: odknt <oda.kenta.hj at gmail.com>
pkgname=bspwmbar
pkgver=0.1.1
pkgrel=1
arch=(x86_64)
license=('ISC')
url='https://github.com/odknt/bspwmbar'
depends=(bspwm alsa-lib libxft fontconfig)
source=("https://github.com/odknt/bspwmbar/archive/v${pkgver}.tar.gz"
        'config.h')
sha256sums=('a232b9e95825895a5ccee34c2e36a5931d47b9f6c9d627d0fe9b1773d056d08e'
            'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cp ../config.h ./config.h
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install PREFIX=/usr DESTDIR="${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
