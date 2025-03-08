# Maintainer: Vbextreme <@>
# Contributor: Vbextreme <@>
prj='auror'
pkgname=($prj)
pkgdesc='only for developer until software is in first alpha'
pkgver='0.0.8'
pkgrel=1
arch=('x86_64')
url="https://github.com/vbextreme/${prj}.git"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vbextreme/${prj}/archive/v${pkgver}.tar.gz")
license=('GPL3')
sha256sums=('SKIP')
makedepends=('meson' 'ninja')
depends=('curl' 'zlib-ng-compat' 'readline' 'libgit2' 'tree-sitter' 'tree-sitter-bash' 'namcap' 'cryptominisat')

prepare() {
    cd "${prj}-${pkgver}"
    meson setup build -Dprefix=/usr
}

build() {
    cd "${prj}-${pkgver}/build"
    ninja
}

package() {
    cd "${prj}-${pkgver}/build"
    DESTDIR="$pkgdir" ninja install
}

