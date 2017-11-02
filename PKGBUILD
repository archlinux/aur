# Maintainer: Kristopher Clark <krisclarkdev@krisbox.org>
# Contributor: sum01 <sum01@protonmail.com>
pkgname=tpm2-pk11
pkgver=r55.fc7e930
pkgrel=1
pkgdesc="PKCS#11 Module for TPM 2.0"
arch=('i686' 'x86_64')
url="https://github.com/kclark-jenkins/tpm2-pk11.git"
license=('LGPL2.1')
makedepends=('git' 'cmake' 'make' 'gcc' 'sed')
source=("$pkgname::git+https://github.com/kclark-jenkins/tpm2-pk11.git")
md5sums=('SKIP')
pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "$srcdir/$pkgname"
    mkdir build
    cd build
    cmake ..
    make
    echo "Visit https://github.com/irtimmer/tpm2-pk11 for usage instructions"
}
package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir" install

    echo "Visit https://github.com/irtimmer/tpm2-pk11 for usage instructions"
}
