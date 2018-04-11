# Maintainer: Roman Seleznev <alone.inbox@gmail.com>
# This PKGBUILD is maintained at https://github.com/TechCatOther/aur-packages


pkgbase=aps-php-runtime
pkgname=('aps-php-runtime')
pkgdesc='Parallels APS PHP Runtime'
pkgver=7.2
subversion=106
pkgrel=2
arch=('any')
url='https://doc.apsstandard.org/7.3/resources/tools/php-lib/#php-runtime'
license=('custom')
replaces=('aps-php-runtime')
conflicts=('aps-php-runtime')
provides=('aps-php-runtime')
depends=('php>=7.2')
optdepends=()
makedepends=()

source=("http://download.apsstandard.org/php.runtime/aps-php-runtime-${pkgver}-${subversion}.zip")
md5sums=(068e7ee0cc6d1f31b870f087e0c04227)

prepare() {
    echo 'indule_path = ${include_path}:/usr/share/aps/php' > ${srcdir}/aps.ini
}

package() {
   mkdir -p ${pkgdir}/usr/share/aps/php/aps/2/{formats,types}
   install -D -m644 -t ${pkgdir}/usr/share/aps/php/aps/2/ ${srcdir}/aps/2/*.php 
   install -D -m644 -t ${pkgdir}/usr/share/aps/php/aps/2/formats/ ${srcdir}/aps/2/formats/*.php
   install -D -m644 -t ${pkgdir}/usr/share/aps/php/aps/2/types/ ${srcdir}/aps/2/types/*.php 
   install -D -m644 -t ${pkgdir}/etc/php/conf.d/ ${srcdir}/aps.ini
}

# vim:set ts=4 sw=4 et:

