# Maintainer: Fijxu <fijxu [at] nadeko [dot] net>
# Contributor: Yacob Zitouni <yacob.zitouni@gmail.com>

pkgname="projectctr-makerom"
pkgver=0.19.0
pkgrel=1
pkgdesc="Creates CTR cxi/cfa/cci/cia files"
arch=('x86_64')
url="https://github.com/3DSGuy/Project_CTR/tree/master/makerom"
license=('MIT')
depends=('libstdc++' 'libgcc' 'glibc')
source=("https://github.com/3DSGuy/Project_CTR/archive/refs/tags/makerom-v$pkgver.tar.gz")
sha256sums=('446bd23919b7e9fa10540a784202d388a0b93ef4d7165f3990481edd2aa2f946')

build() {
    cd "$srcdir/Project_CTR-makerom-v$pkgver/makerom"
    make deps
    make
}

package() {
    install -Dm755 "$srcdir"/Project_CTR-makerom-v$pkgver/makerom/bin/makerom "$pkgdir"/usr/bin/makerom
}
