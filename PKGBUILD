# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=detox
pkgver=1.2.0
pkgrel=1
pkgdesc="An utility designed to clean up filenames by replacing characters with standard equivalents"
arch=('i686' 'x86_64')
url="http://detox.sourceforge.net/"
license=('BSD')
makedepends=('flex')
options=('!makeflags')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('da34c6bc3c68ce2fb008e25066e72927')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc/detox
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

#license file
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
