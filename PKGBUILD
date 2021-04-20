# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Genki Sky <alt+archlinux.org@genki.is>

pkgname=lingot-git
pkgver=20201229.a7d2b6c
pkgrel=1
pkgdesc='musical instrument tuner (git)'
arch=(i686 x86_64)
url='http://nongnu.org/lingot/'
license=('GPL2')
depends=('gtk3')
makedepends=('git' 'intltool')
provides=('lingot')
conflicts=('lingot')
source=('git+https://git.savannah.nongnu.org/git/lingot.git')
md5sums=('SKIP')

pkgver() {
    cd lingot
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
    cd lingot
    ./bootstrap
    ./configure --prefix=/usr
    make
}

package() {
    cd lingot
    make DESTDIR="$pkgdir" install
}
