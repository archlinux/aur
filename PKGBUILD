# Maintainer: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Manuel Mendez <mmenedez534 at gmail dot com>
# Contributor: Markus Opitz <mastero23 at gmail dot com>

pkgname=lttng-modules
pkgver=2.7.0
pkgrel=1
pkgdesc="Kernel Modules for LTTng"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('LGPL2.1' 'GPL2' 'MIT')
depends=('linux>=2.6.38')
makedepends=('linux-headers')
install=${pkgname}.install
source=(http://lttng.org/files/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('b98b85cd71c03d511b37790644353c7209bcadd4')

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make modules_install INSTALL_MOD_PATH=${pkgdir}/usr
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
