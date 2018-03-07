# Maintainer: Adria Arrufat (archdria) <swiftscythe@gmail.com>
pkgname=pyuv
pkgver=0.7.0
pkgrel=1
pkgdesc="A raw video sequence player"
arch=('i686' 'x86_64')
url="https://github.com/gbaruffa/pyuv-player"
license=('GPL')
depends=('wxgtk')
source=("https://github.com/gbaruffa/pyuv-player/archive/v${pkgver}.tar.gz")
md5sums=('d0d32e9c8b9b32e57b3264a0b1ad0f6b')

build() {
  cd ${pkgname}-player-${pkgver}
  aclocal
  autoconf
  autoheader
  automake --add-missing
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-player-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
