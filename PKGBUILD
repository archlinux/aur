# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instantdotfiles
pkgname=$_pkgname
pkgver=202007191412
pkgrel=1
pkgdesc="dotfiles for instantOS"
url="https://github.com/paperbenni/dotfiles"
arch=('any')
license=('MIT')
depends=('sh' 'bash')
makedepends=('git')
provides=(instantdotfiles)
conflicts=(instantdotfiles)
source=("$_pkgname::git+https://github.com/paperbenni/dotfiles.git")

sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo "$(date '+%Y%m%d%H%M')"
}

prepare() {
    cd $_pkgname
}

build() {
    cd $_pkgname
    echo "no build"
}

package() {
    cd $_pkgname
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/instantdotfiles
    git rev-parse --short HEAD > ${pkgdir}/usr/share/instantdotfiles/versionhash
    chmod +x *.sh
    chmod +x fonts/*.sh
    chmod +x instantdotfiles
    chmod +x ranger/commands.py

    mv instantdotfiles ${pkgdir}/usr/bin/instantdotfiles

    mv ./* ${pkgdir}/usr/share/instantdotfiles/

}
