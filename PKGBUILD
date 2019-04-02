# maintainer: odknt <oda.kenta.hj at gmail.com>
pkgname=bspwmbar
pkgver=0.0.1
pkgrel=1
arch=(x86_64)
license=('ISC')
depends=(bspwm alsa-lib libxft fontconfig)
source=("https://github.com/odknt/bspwmbar/archive/v${pkgver}.tar.gz"
        'config.h')
sha256sums=('06df858cbade8aaf17a742dd0f7ddf57d25bcf94eded4c74525c3112aecd2a83'
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
