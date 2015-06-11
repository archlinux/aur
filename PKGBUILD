# Maintainer: Mathieu OTHACEHE <m.othacehe@gmail.com>

pkgname=eventstat-git
_pkgname=eventstat
pkgver=V0.01.33.r0.gfc7a504
pkgrel=1
pkgdesc="Simple monitoring of system events"
url="http://kernel.ubuntu.com/~cking/eventstat/"
arch=('any')
license=('GPL')
makedepends=('git')
conflicts=("$_pkgname")
source=(git+git://kernel.ubuntu.com/cking/eventstat.git)
sha256sums=('SKIP')
PKGEXT='.pkg.tar.gz'

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags --long | sed -E 's/([^-]+-g)/r\1/;s/-/./g;s/^v//g'
}

build() {
    cd ${srcdir}/$_pkgname

    make
}

package() {
    cd ${srcdir}/$_pkgname

    make DESTDIR=${pkgdir} install
}
