# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=libquvi
pkgver=0.9.3
pkgrel=1
pkgdesc='Library for parsing video download links.'
arch=('i686' 'x86_64')
url='http://quvi.sourceforge.net/'
license=('AGPL3')
depends=('libquvi-scripts' 'curl' 'lua51' 'libproxy' 'libgcrypt' 'glib2')
conflicts=('quvi<0.9.0')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/quvi/${pkgname}-${pkgver}.tar.xz"{,.sig})
md5sums=('12a62c4fcde9b6109193191b7bd3d685'
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
