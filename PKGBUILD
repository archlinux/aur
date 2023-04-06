# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=xorg-ico
pkgver=1.0.6
pkgrel=1
pkgdesc="A simple animation program that may be used for testing various X11 operations and extensions."
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('libx11')
groups=('xorg-apps' 'xorg')
source=(https://xorg.freedesktop.org/archive/individual/app/ico-${pkgver}.tar.gz)
sha512sums=('d6b15e516d34aa201eaac2ab53bd911825fb85e516f1efe15d85e2fb309fdd6155b24b0fbb98552dd12d2c6c271047ff94d0e9525b297bd165fefa55565de550')

build() {
  cd ico-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd ico-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}


