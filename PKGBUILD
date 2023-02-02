# Maintainer: Abderrahman-byte <el.abderrahman00@gmail.com>
# Contributor: Abderrahman-byte <el.abderrahman00@gmail.com>

pkgname=passmg
pkgver=2.0.0
pkgrel=1
pkgdesc="Yet another cli based password manager"
url="https://github.com/Abderrahman-byte/passmg"
license=('GPL3')
depends=(
    'sqlite3>=3.0'
    'openssl>=3.0'
)
makedepends=(
    'cmake>=3.11' 
    'make' 
    'git')
provides=('passmg')
arch=(
    'any'
)
source=("${pkgname}-${pkgver}::https://github.com/Abderrahman-byte/passmg/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('95f22fea07c01cdd8c02c9f83a85440ce6a9d85c1c2f93163702c61a2ad5fddb')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -B ./build -DCMAKE_BUILD_TYPE=Release
    cmake --build ./build --config Release 
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D build/src/$pkgname $pkgdir/usr/bin/$pkgname
}

