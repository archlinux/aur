# Maintainer: Tomasz Wisniewski <tomasz.wisni3wski@gmail.com>
pkgname=bashnapi
pkgver=2.0.0
pkgrel=1
pkgdesc="bashnapi is a napiprojekt.pl bash client bundled with subotage - a universal subtitles format converter"
arch=('any')
url="https://github.com/dagon666/napi"
license=('GPL')
groups=()
depends=('bash' 'coreutils' 'sed' 'gawk' 'file' 'cmake' 'grep' 'findutils' 'wget')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/dagon666/napi/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('c86efaa856f7e80e993456aff9ced322')

build() {
    builddir="${pkgname}-${pkgver}-build"
    srcdir="napi-${pkgver}"
    mkdir -p "$builddir"
    cd "$builddir"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" ../${srcdir}
    make
}

package() {
    builddir="${pkgname}-${pkgver}-build"
    cd "$builddir"
    make install
}
