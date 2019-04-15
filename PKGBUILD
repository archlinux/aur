# maintainer: odknt <oda.kenta.hj at gmail.com>
pkgname=bspwmbar
pkgver=0.1.0
pkgrel=1
arch=(x86_64)
license=('ISC')
url='https://github.com/odknt/bspwmbar'
depends=(bspwm alsa-lib libxft fontconfig)
source=("https://github.com/odknt/bspwmbar/archive/v${pkgver}.tar.gz"
        'config.h')
sha256sums=('9f0695e7fd79e5a0f20e2bf9b0bbd10f0caf241cb979badd97c3671a2eb551e6'
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
