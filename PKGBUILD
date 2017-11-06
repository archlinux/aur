# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Matthias Maennich <arch@maennich.net>

pkgname=command-not-found
pkgver=0.6.1
pkgrel=3
_commit=102ea6e2797b6191a7357c94a162f08a3eef4e66
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
install=$pkgname.install
source=("$url/archive/$_commit.tar.gz")
md5sums=('22405bf48c18547a1033107e38533e61')

build() {
    cd $pkgname-$_commit
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="" \
      src
    make
}

package(){
    cd $pkgname-$_commit
    make DESTDIR="$pkgdir" install
}
