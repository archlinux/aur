# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=libcompizconfig
pkgver=0.8.12
pkgrel=1
pkgdesc="Compiz configuration system library"
arch=('i686' 'x86_64')
url="http://blog.northfield.ws/compiz-release-announcement-0-8-12/"
license=('GPL')
depends=('compiz-core' 'libxml2' 'libxcomposite' 'libxinerama' 'protobuf' 'startup-notification')
makedepends=('intltool' 'libxrandr' 'libice' 'libsm' 'mesa')
options=('!emptydirs')
source=("libcompizconfig-${pkgver}.tar.xz::http://www.northfield.ws/projects/compiz/releases/${pkgver}/libcompizconfig.tar.xz")

prepare() {
    cd "${srcdir}/${pkgname}"
}

build() {
    cd "${srcdir}/${pkgname}"
    CPPFLAGS="$CPPFLAGS -I/usr/include/compiz \
                        -I/usr/include/startup-notification-1.0 \
                        -I/usr/include/libxml2" \
                        ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" install
}

sha256sums=('e3b313c9dd1690727fb21ece747e5c1bc27bd006fbe95292856b56f92513a409')
