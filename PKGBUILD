# Maintainer: Axel Juraske <moin@axju.de>
pkgname=axju-backgrounds
pkgver=r1.251a09c
pkgrel=1
epoch=
pkgdesc="A collection of wallpapers for axju-os."
arch=('x86_64')
url="https://github.com/axju/axju-os.git"
license=('MIT')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(axju-backgrounds)
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
    cd axju-os 
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd axju-os/src/backgrounds
    mkdir -p ${pkgdir}/usr/share/backgrounds/${pkgname}
    cp -rf * ${pkgdir}/usr/share/backgrounds/${pkgname}
    #install -Dm644 README.org "${pkgdir}/usr/share/doc/${pkgname}/README.org"
}
