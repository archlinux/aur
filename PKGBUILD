# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=xorg-fslsfonts
pkgver=1.0.6
pkgrel=1
pkgdesc="Produces a list of fonts served by an X font server."
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('libfs')
groups=('xorg-apps' 'xorg')
source=(https://xorg.freedesktop.org/archive/individual/app/fslsfonts-${pkgver}.tar.gz)
sha512sums=('58e63dc3ea237dced1ce9f4eea54e117e55664a2304491b69f2ecb805edaaf0be2e65a760645d0f24630d4d43a152a3e4b22e5e50187a85900e88e9dac81c428')

build() {
  cd fslsfonts-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd fslsfonts-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}



