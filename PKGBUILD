# Maintainer: Kevin R <rk@rkevin.dev>

pkgname=clidrag
pkgver=1.0
pkgrel=1
pkgdesc='Command line tool to drag files into GUI applications'
arch=('x86_64') # although other architectures should work
url="https://github.com/rkevin-arch/CLIdrag"
license=('Unlicense')
depends=('qt5-base')
source=("https://github.com/rkevin-arch/CLIdrag/releases/download/v$pkgver/clidrag-$pkgver-src.tar.gz")
sha256sums=('6b7776553b0be9ee09790d2e6ca40a4a4db4a3e84a79631cf215ff4f39b469e4')

build() {
    cd $pkgname-$pkgver
    qmake && make
}

package() {
    install -m755 -D "$pkgname-$pkgver/bin/drag" "$pkgdir/usr/bin/drag"
}
