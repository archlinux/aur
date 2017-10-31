# Maintainer: Kristopher Clark <krisclarkdev@krisbox.org>

pkgname=tpm2-pk11
pkgver=1.0.0
pkgrel=1
pkgdesc="PKCS#11 Module for TPM 2.0"
arch=('i686' 'x86_64')
url="https://github.com/kclark-jenkins/tpm2-pk11.git"
license=('GNU Lesser General Public License v2.1')
makedepends=('git' 'cmake' 'make' 'gcc')
source=("$pkgname::git+https://github.com/kclark-jenkins/tpm2-pk11.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    mkdir build
    cd build
    cmake ..
    make
    echo "Visit https://github.com/irtimmer/tpm2-pk11 for usage instructions"
}

package() {
    cd "$srcdir/$pkgname"
    cd build
    sudo make install

    echo "Visit https://github.com/irtimmer/tpm2-pk11 for usage instructions"
}
