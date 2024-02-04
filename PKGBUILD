# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=satyr
pkgver=0.43
pkgrel=1
pkgdesc='Automatic problem management with anonymous reports'
arch=('i686' 'x86_64')
depends=('gperf' 'json-c' 'libelf' 'python' 'rpm-tools')
makedepends=('python-sphinx')
url='https://github.com/abrt/satyr'
license=('GPL')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/abrt/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('599a594d6f9de1f0a3ebf16f7c4405dc326369e25486fca58e7b9d49f7a0eeaa')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
