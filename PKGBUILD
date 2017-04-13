# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Matthias Maennich <arch@maennich.net>

pkgname=command-not-found
pkgver=0.6.1
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
             'cmake'
             'git')
md5sums=('d828f5c974f2b3b6009de725ac4fdbc2')
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
