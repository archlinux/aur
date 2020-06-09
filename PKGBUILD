# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instantthemes
pkgname=$_pkgname
pkgver=20204208429760e
pkgrel=1
pkgdesc="theme files for instantOS"
url="https://github.com/instantOS/instantTHEMES"
arch=('any')
license=('MIT')
depends=('sh' 'papirus-icon-theme' 'arc-gtk-theme')
makedepends=('git')
provides=(instantthemes)
conflicts=(instantthemes)
source=("$_pkgname::git+https://github.com/instantOS/instantthemes.git")

sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo "$(date '+%Y%m%d%H%M')"
}

prepare() {
    cd $_pkgname
    echo "no prepare"
}

build() {
    cd $_pkgname
    echo "no build"
}

package() {
    cd $_pkgname
    mkdir -p ${pkgdir}/usr/share/instantthemes
    mkdir -p ${pkgdir}/usr/bin

    chmod +x *.sh
    chmod +x instantthemes
    mv instantthemes ${pkgdir}/usr/bin
    rm README.md
    mv ./* ${pkgdir}/usr/share/instantthemes/
}
