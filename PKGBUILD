# Maintainer: prash <prash.n.rao@gmail.com>

pkgname=acpica
pkgver=20150515
pkgrel=2
pkgdesc="An implementation of the ACPI specification. Contains tools like acpidump, iasl, acpixtract, etc."
url="https://www.acpica.org/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('glibc')
makedepends=('flex' 'bison')
conflicts=('iasl')


source=("https://acpica.org/sites/acpica/files/${pkgname}-unix-${pkgver}.tar.gz")


md5sums=('c8c128b2d4859b52bc9c802faba2e908')

build() {
  cd "${srcdir}/${pkgname}-unix-${pkgver}"
  make -j2
}

package() {
  cd "${srcdir}/${pkgname}-unix-${pkgver}"
  make DESTDIR=${pkgdir} install
}
