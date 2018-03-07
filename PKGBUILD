# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pd-jacktime-git
pkgver=8.7fa6d37
pkgrel=2
pkgdesc="Jack transport client for Pd"
arch=("i686" "x86_64")
license=('GPL')
url="https://github.com/agraef/pd-jacktime"
depends=('pd-lua')
makedepends=('pkg-config')
source=("git+https://github.com/agraef/pd-jacktime.git")
md5sums=('SKIP')

pkgver() {
    cd $srcdir/pd-jacktime
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
     cd $srcdir/pd-jacktime
     make
}

package() {
     cd $srcdir/pd-jacktime
     make DESTDIR="$pkgdir" prefix=/usr install
}
