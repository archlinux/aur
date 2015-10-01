# Maintainer: Adrien Oliva <yapbreak@yapbreak.fr>
pkgname="yaplog"
pkgver="2.2.1"
pkgrel="2"
pkgdesc="Log system library for C/C++ projects"
arch=('any')
url="https://redmine.yapbreak.fr/projects/yaplog"
license=('GPL3')
depends=()
optdepends=()
makedepends=('gcc')
conflicts=('yaplog-git')
replaces=()
backup=()
source=("http://release.yapbreak.fr/${pkgname}/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
noextract=()
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
    ./configure
    make
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
    make DESTDIR="${pkgdir}/" install
}
