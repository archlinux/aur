# Maintainer: Thermi <noel [at] familie-kuntze dot com>

pkgname=softflowd
pkgver=1.0.0
pkgrel=1
pkgdesc="open source netflow probe"
url='http://www.mindrot.org/projects/softflowd/'
license=("BSD")
arch=('i686' 'x86_64')
makedepends=('automake')

source=("https://github.com/irino/softflowd/archive/softflowd-${pkgver}.tar.gz")

sha256sums=('98aa66026d730211b45fe89670cd6ce50959846d536880b82f5afbca6281e108')

prepare() {
	cd ${srcdir}/softflowd-softflowd-${pkgver}
  autoreconf -if
	
}
build() {
  cd ${srcdir}/softflowd-softflowd-${pkgver}/

  ./configure --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/softflowd-softflowd-${pkgver}"
  make DESTDIR=${pkgdir} install
}
