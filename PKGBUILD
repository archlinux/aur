# Maintainer: Nicholas Dumas <nicholas.dumas@outlook.com>
pkgname=starlink-pal
pkgrel=1
pkgdesc="Positional Astronomy Library"
url="https://github.com/Starlink/pal"
arch=('x86_64' 'i686')
license=('LGPL3')
source=('https://github.com/Starlink/pal/releases/download/v0.9.8/pal-0.9.8.tar.gz')
depends=('erfa')
conflicts=('icecube-pal-git')
pkgver=v0.9.8
md5sums=('SKIP')

build() {
  cd "${srcdir}/pal-0.9.8"
  ./configure --prefix=/usr --without-starlink
  make
}

package() {
  cd "${srcdir}/pal-0.9.8"
  make DESTDIR="$pkgdir/" install
}
