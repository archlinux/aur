# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Markus Martin <markus@archwyrm.net>

pkgname=yaml-cpp51
_origpkgname=yaml-cpp
pkgver=0.5.1
pkgrel=1
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec"
url="https://github.com/jbeder/yaml-cpp"
arch=('i686' 'x86_64')
license=('MIT')
depends=('gcc-libs')
makedepends=('boost' 'cmake')
source=(https://github.com/jbeder/yaml-cpp/archive/release-${pkgver}.tar.gz)
md5sums=('76c47d4a961797092650806dfdfc6cd9')

build() {
    cd "$srcdir/$_origpkgname-release-$pkgver"

    cmake . -DCMAKE_INSTALL_PREFIX=/opt/yaml-cpp51 -DBUILD_SHARED_LIBS=ON
    make
}

package() {
    cd "$srcdir/$_origpkgname-release-$pkgver"
    make DESTDIR="$pkgdir" install

    install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
