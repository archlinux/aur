# Maintainer: Blisfull <narthana.epa@gmail.com>
# Contributer: SahibBommelig <sahib@online.de>
# rmlint PKBUILD for ArchLinux
 
pkgname=rmlint
pkgver=2.2.0
pkgrel=1
pkgdesc="Tool to remove duplicates and other lint, being much faster than fdupes"
arch=('i686' 'x86_64')
url="https://github.com/sahib/rmlint"
license=('GPL3')
depends=('glibc' 'glib2>=2.31' 'libutil-linux' 'elfutils')
makedepends=('scons' 'python-sphinx')
conflicts=("${pkgname}-git")
source=("https://github.com/sahib/rmlint/archive/v${pkgver}.tar.gz")
md5sums=('2e2087254849ea2dbf769c753b9ca596')
 
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    scons config
    scons -j4 DEBUG=1 --prefix=${pkgdir}/usr --actual-prefix=/usr
}
 
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    scons DEBUG=1 --prefix=${pkgdir}/usr install --actual-prefix=/usr
}
