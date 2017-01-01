# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Matthias Maennich <arch@maennich.net>

pkgname=command-not-found
pkgver=0.6.0
pkgrel=1
pkgdesc="In case a command could not be found this utility searches for packages containing this or a similar command (bash,zsh)."
arch=('i686' 'x86_64')
url="http://github.com/metti/$pkgname"
license=('GPL')
depends=('boost-libs'
         'libarchive'
         'tdb'
         'wget')
makedepends=('boost'
             'cmake'
             'git')
md5sums=('e991b83a0f0a65b4180683cd04c845e5')
install=$pkgname.install
source=("$url/archive/v$pkgver.zip")

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
