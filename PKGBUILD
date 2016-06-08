# Maintainer: prash <prash.n.rao@gmail.com>

pkgname=acpica
pkgver=20160527
pkgrel=1
pkgdesc="An implementation of the ACPI specification. Contains tools like acpidump, iasl, acpixtract, etc."
url="https://www.acpica.org/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('glibc')
makedepends=('flex' 'bison')
conflicts=('iasl')


source=("https://acpica.org/sites/acpica/files/${pkgname}-unix-${pkgver}.tar.gz")


md5sums=('be677fc358de9dadc036e1ea678a101b')

build() {
  cd "${srcdir}/${pkgname}-unix-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-unix-${pkgver}"
  make DESTDIR=${pkgdir} install
}
