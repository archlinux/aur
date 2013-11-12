# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=libquvi
pkgver=0.9.4
pkgrel=1
pkgdesc='Library for parsing video download links.'
arch=('i686' 'x86_64')
url='http://quvi.sourceforge.net/'
license=('AGPL3')
depends=('libquvi-scripts' 'curl' 'lua' 'libproxy' 'libgcrypt' 'glib2')
conflicts=('quvi<0.9.0')
source=("http://downloads.sourceforge.net/sourceforge/quvi/${pkgname}-${pkgver}.tar.xz"{,.sig})
md5sums=('8e3f2134a6b3376934bd884b07dcdac5'
         'SKIP')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
