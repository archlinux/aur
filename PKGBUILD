pkgname=wenger-crosstool-ng

pkgver=v1.22.0
pkgrel=1

pkgdesc="crosstool-NG aims at building toolchains."
arch=('x86_64')
url="http://crosstool-ng.org/"
license=('GPL')

depends=('ncurses' 'make' 'rsync')
makedepends=('git' 'flex' 'bison' 'gperf' 'help2man' 'unzip' 'lzip' 'python')

provides=('crosstool-ng')
conflicts=('crosstool-ng' 'crosstool-ng-git')


source=('crosstool-ng-1.22.0.tar.gz::https://github.com/virtualcabinet/crosstool-ng/archive/refs/tags/v1.22.0.tar.gz')

b2sums=('SKIP')

# pkgver() {
#     echo "PKG VER: start handling package version ..."
#     cd crosstool-ng-1.22.0
#     echo "PKG VER: handling package version finished"
# }

# prepare () {
#     cd crosstool-ng
#     git pull --no-edit origin pull/1368/head
# }

build () {    
    # Changing Work Directory.
    cd crosstool-ng-1.22.0
    # autoconf
    ./bootstrap
    # configure
    ./configure --prefix="/usr"
    # make
    make
}

package () {
    # Changing Work Directory.
    cd crosstool-ng-1.22.0
    # make install
    make DESTDIR="$pkgdir" install
}
