# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=cppgraphqlgen
pkgver=4.5.0
pkgrel=1
pkgdesc="Set of GraphQL libraries and tools"
arch=('i686' 'x86_64')
url="https://github.com/microsoft/cppgraphqlgen"
license=('MIT')
groups=()
depends=('boost-libs')
makedepends=('cmake'
    'pegtl'
    'rapidjson')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://codeload.github.com/microsoft/$pkgname/tar.gz/v$pkgver)
noextract=()
md5sums=('45b0994a06acd0a2602b2bca126f897b')

build()
{
    cd $pkgname-$pkgver
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -Wno-dev ..
    make
}

package()
{
    cd "$pkgname-$pkgver"
    cd build
    make DESTDIR="$pkgdir/" install
    mv $pkgdir/usr/bin/$pkgname/* $pkgdir/usr/bin/
    rm -fr $pkgdir/usr/bin/$pkgname
}

