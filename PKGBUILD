# Contributer: Blisfull <narthana.epa@gmail.com>
# Contributer: SahibBommelig <sahib@online.de>
# Maintainer: tee < teeaur at duck dot com >
 
pkgname=rmlint
pkgver=2.10.3
pkgrel=1
pkgdesc="Tool to remove duplicates and other lint, being much faster than fdupes"
arch=('i686' 'x86_64')
url="https://github.com/sahib/rmlint"
license=('GPL3')
depends=('libutil-linux' 'elfutils')
makedepends=('scons' 'python-sphinx')
conflicts=("${pkgname}-git")
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('8ffdbd5d09d15c8717ae55497e90d6fa46f085b45ac1056f2727076da180c33e')
 
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    scons config
    scons -j4 DEBUG=1 --prefix=${pkgdir}/usr --actual-prefix=/usr
}
 
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    scons DEBUG=1 --prefix=${pkgdir}/usr install --actual-prefix=/usr --without-compile-glib-schemas
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
