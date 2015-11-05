# Maintainer: prash <prash.n.rao@gmail.com>

pkgname=acpica
pkgver=20150930
pkgrel=1
pkgdesc="An implementation of the ACPI specification. Contains tools like acpidump, iasl, acpixtract, etc."
url="https://www.acpica.org/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('glibc')
makedepends=('flex' 'bison')
conflicts=('iasl')


source=("https://acpica.org/sites/acpica/files/${pkgname}-unix-${pkgver}.tar.gz")


md5sums=('32116f599845c8ddb7126f5d99d56412')

build() {
  cd "${srcdir}/${pkgname}-unix-${pkgver}"
  make -j2
}

package() {
  cd "${srcdir}/${pkgname}-unix-${pkgver}"
  make DESTDIR=${pkgdir} install
}
