# Common information
maintainer="Evilur <andrewflame@mail.ru>"
pkgname=universal-pause
provides=('upause')
pkgver=1.0
pkgrel=1
arch=('x86_64')
license=('MIT')
url="https://github.com/Evilur/UniversalPause"
pkgdesc="Universal pause for Linux games. Allows you to pause non-pausable cutscenes and games"

# Dependencies
depends=('xdotool' 'util-linux' 'procps-ng' 'coreutils')
makedepends=('make')
optdepends=('sox: for playing sounds')

# Source
source=("https://github.com/Evilur/UniversalPause/releases/download/v$pkgver/$pkgname.tar.gz")
md5sums=('50cddaf43e957115c7e1fefb09215c84')
sha256sums=('4319a3135ce1a0f6647f9bd2e9f169124eb56904cc4071660c9421d8e7c140e5')
sha512sums=('cb8a18eff5a84ec035adf766d8931a5b7d466553143b702f7bc86fbf6d1d97ca083fa10fbfa5ed056ffcdf44aeae00f0206d7ee735bc4f14416bcd01b7008f08')

# Package
package() {
    # Go to the source dir
    cd $srcdir

    # Init target directories
    target=$pkgdir/usr/share/UniversalPause
    target_bin=$pkgdir/usr/bin

    # Create target directories
    mkdir --parent $target
    mkdir --parent $target_bin

    # Install the program to the target directories
    make TARGET=$target TARGET_BIN=$target_bin clean install
}
