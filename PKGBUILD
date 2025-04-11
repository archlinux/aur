# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: philomath <philomath868 AT gmail DOT com>
# Contributor: aksr <aksr at t-com dot me>

pkgname=xjobs
pkgver=20250209
pkgrel=1
pkgdesc="A utility like xargs, but with enhanced support for multiprocessor machines"
arch=('i686' 'x86_64')
url="http://www.maier-komor.de/xjobs.html"
license=('GPL-2.0')
depends=('glibc' 'ncurses')
makedepends=('make' 'gcc')
source=("http://www.maier-komor.de/xjobs/${pkgname}-${pkgver}.tgz")
md5sums=('61d12fac69b7f7b97f10655754b58399')
sha1sums=('2034ec50ab776be2a38cc21675a08875a7f23863')
sha256sums=('23b56eecdba72441388a82daa7e18f9ea206da37f34b1e968f674e4266fdbee9')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}
