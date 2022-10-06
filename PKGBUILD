# Maintainer: Axel Juraske <moin@axju.de>
pkgname=axju-mynux
pkgver=r27.6d45306
pkgrel=1
epoch=
pkgdesc="A collection of wallpapers for axju-os."
arch=('x86_64')
url="https://github.com/axju/dotfiles.git"
license=('MIT')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(axju-mynux)
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd dotfiles
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd dotfiles
    mkdir -p ${pkgdir}/usr/share/mynux/storage/axju
    cp -rf mynux.toml ${pkgdir}/usr/share/mynux/storage/axju/mynux.toml
    cp -rf .config ${pkgdir}/usr/share/mynux/storage/axju/.config
    cp -rf .local ${pkgdir}/usr/share/mynux/storage/axju/.local
    cp -rf .bashrc ${pkgdir}/usr/share/mynux/storage/axju/.bashrc
    cp -rf .xinitrc ${pkgdir}/usr/share/mynux/storage/axju/.xinitrc
}
