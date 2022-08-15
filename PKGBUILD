pkgname=kavpass
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="Release of my password generator called kavpass."
arch=(x86_64 i686)
url="https://github.com/kavulox/kavpass.git"
license=('AGPL')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
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
    mkdir -p include bin objs
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    make && make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
clean() {
    rm -rf src/ pkg/ kavpass/
}
