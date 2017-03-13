# Maintainer: urain39 <hexiedeshijie@gmail.com>

pkgname=myget
pkgver=0.1.1
pkgrel=1
pkgdesc="Mytget is a muti-thread downloader accelerator for GNU/Linux."
arch=('i686' 'x86_64' 'aarch64')
url="http://myget.sourceforge.net"
license=('GPLv2')
depends=()
optdepends=()
makedepends=(
    'cmake'
    'doxygen'
)

source=('git+https://github.com/lytsing/mytget.git')
md5sums=('SKIP')

install=${pkgname}.install

build() {
    cd ${srcdir}/mytget
    cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd ${srcdir}/mytget
    
    make install DESTDIR=${pkgdir}
    #install -Dm0755 ${srcdir}/src/mytget ${pkgdir}/usr/bin/mytget

    ln -s ${pkgdir}/usr/bin/mytget ${pkgdir}/usr/bin/myget
}

# vim: set ts=4 tw=60 sw=4 et:
