#$Id: PKGBUILD 64614 2010-01-21 11:40:53Z allan $
# Maintainer: Hugo Doria <hugo@archlinux.org>

_pkgbasename=libcap
pkgname=lib32-$_pkgbasename
pkgver=2.21
pkgrel=1
pkgdesc="POSIX 1003.1e capabilities (32-bit)"
arch=(x86_64)
url="http://www.kernel.org/pub/linux/libs/security/linux-privs/"
license=('GPL')
depends=('lib32-attr' $_pkgbasename)
makedepends=('gcc-multilib')
source=(http://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('61966ef40f2dee8731b69db895e4548d')

build() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  make -C libcap CC="gcc -m32" prefix=/usr lib=lib32 DESTDIR=${pkgdir} install
  chmod 755 ${pkgdir}/usr/lib32/libcap.so.${pkgver}

  rm -rf "${pkgdir}/usr/include"
}
