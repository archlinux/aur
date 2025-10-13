# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: philomath <philomath868 AT gmail DOT com>
# Contributor: aksr <aksr at t-com dot me>

pkgname=xjobs
pkgver=20250529
pkgrel=1
pkgdesc="A utility like xargs, but with enhanced support for multiprocessor machines"
arch=('x86_64' 'i686')
url="http://www.maier-komor.de/xjobs.html"
license=('GPL-2.0')
depends=('glibc' 'ncurses')
makedepends=('make' 'gcc')
source=("http://www.maier-komor.de/xjobs/${pkgname}-${pkgver}.tgz")
md5sums=('bc0e943864e4c2f0f49d0179fa93c2da')
sha1sums=('fc028e61010af90ddd9b7efc43bcc2c4ed3c82d4')
sha256sums=('1d1ee4ab1f4de5f9fc24c2852b489eac0c2b085964a8aa364bf9b1416f54138e')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}
