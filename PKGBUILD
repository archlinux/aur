# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Matthias Maennich <arch@maennich.net>

pkgname=command-not-found
pkgver=0.6.2
pkgrel=2
pkgdesc="In case a command could not be found this utility searches for packages containing this or a similar command (bash,zsh)."
arch=('i686' 'x86_64')
url="http://github.com/metti/$pkgname"
license=('GPL')
depends=('boost-libs'
         'libarchive'
         'tdb'
         'wget')
makedepends=('boost'
             'cmake')
install=$pkgname.install
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('b6a9eba4049d11acf76228db6604be52')

build() {
    cd $pkgname-$pkgver
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="" \
      src
    make
}

package(){
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
