# Maintainer: prash <prash.n.rao@gmail.com>

pkgname=acpica
pkgver=20160729
pkgrel=1
pkgdesc="An implementation of the ACPI specification. Contains tools like acpidump, iasl, acpixtract, etc."
url="https://www.acpica.org/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('glibc')
makedepends=('flex' 'bison')
conflicts=('iasl')


source=("https://acpica.org/sites/acpica/files/${pkgname}-unix-${pkgver}.tar.gz")


md5sums=('952322ac9a9de75e16f2f6d0f3dd6a3a')

build() {
  cd "${srcdir}/${pkgname}-unix-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-unix-${pkgver}"
  make DESTDIR=${pkgdir} install
}
