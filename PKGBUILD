# Maintainer: J. Nathanael Philipp <nathanael@philipp.land>
pkgname=coordcon
pkgver=0.1.4
pkgrel=1
pkgdesc="Commandline tool to convert geo coordinates"
arch=("any")
url="https://github.com/jnphilipp/coordcon"
license=("GPL3+")
makedepends=("git" "help2man" "python" "python-virtualenv")
depends=("python" "python-utm")
source=("git+https://github.com/jnphilipp/coordcon.git")
md5sums=(SKIP)

check() {
    cd "$srcdir/$pkgname"
    git checkout $pkgver
    make clean
    make test
}

package() {
    cd "$srcdir/$pkgname"
    git checkout $pkgver
    make install DEST_DIR=$pkgdir BASH_COMPLETION_DIR=/etc/bash_completion.d
}
