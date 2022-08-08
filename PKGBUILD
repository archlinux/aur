pkgname=dwm-kav
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="My fork of Suckless's DWM"
arch=(x86_64 i686)
url="https://github.com/kavulox/dwm.git"
license=('MIT')
groups=()
depends=(libxft)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(dwm)
conflicts=(dwm)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "${_pkgname}"
    printf "1.0.0"
}
package() { 
    cd dwm
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
