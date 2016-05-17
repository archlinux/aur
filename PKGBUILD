# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Matthias Maennich <arch@maennich.net>
pkgname=command-not-found
pkgver=0.5.0
pkgrel=1
pkgdesc="In case a command could not be found this utility searches for packages containing this or a similar command (bash,zsh)."
arch=('i686' 'x86_64')
url="http://github.com/metti/command-not-found"
license=('GPL')
depends=('boost-libs' 'tdb' 'libarchive' 'wget')
makedepends=('boost' 'tdb' 'cmake' 'git')
md5sums=('3f7f705dc151b33742e888bcef17b58b')
install='command-not-found.install'
source=("https://github.com/metti/command-not-found/archive/v${pkgver}.zip")

build() {
    cd "$srcdir/$pkgname-$pkgver"

    cmake -D CMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="" src
    make
}

package(){
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install
}
