# Maintainer: Thermi <noel [at] familie-kuntze dot com>

pkgname=softflowd
pkgver=1.1.1
pkgrel=1
pkgdesc="open source netflow probe"
url='http://www.mindrot.org/projects/softflowd/'
license=("BSD")
arch=('i686' 'x86_64')
makedepends=('automake')

source=("https://github.com/irino/softflowd/archive/refs/tags/softflowd-v${pkgver}.tar.gz")
sha256sums=('a6882e59931e5880901f8ee28d78b082cb3000ad8d28af35c13f2b528edbb2c9')

prepare() {
	cd ${srcdir}/softflowd-softflowd-v${pkgver}
  autoreconf -if
	
}
build() {
  cd ${srcdir}/softflowd-softflowd-v${pkgver}/

  ./configure --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/softflowd-softflowd-v${pkgver}"
  make DESTDIR=${pkgdir} install
}
