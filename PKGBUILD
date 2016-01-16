# Maintainer: Christian Babeux <christian.babeux@0x80.ca>

pkgname=lttv-git
_gitname="lttv"
pkgver=1.5.2.gadc007f
pkgrel=2
pkgdesc="LTTng 2.x viewer"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('GPL2' 'LGPL2.1')
provides=('lttv')
conflicts=('lttv')
makedepends=('git')
depends=('popt' 'babeltrace')
source=('git://git.lttng.org/lttv.git')
sha1sums=('SKIP')

pkgver()
{
    cd ${_gitname}
    git describe --always | sed 's/-/./g;s/^v//'
}

build()
{
    cd ${_gitname}
    ./bootstrap
    ./configure --prefix=/usr
    make
}

package()
{
    cd ${_gitname}
    make install DESTDIR=${pkgdir}
}
