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
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc/detox
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

#license file
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
}
