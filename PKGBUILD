# Maintainer: Léopold Ibghy Koprivnik <skwal.net@gmail.com>
pkgname=mini-matrix-git
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Displays a matrix of random characters"
arch=(x86_64 i686)
url="https://github.com/SkwalExe/mini-matrix.git"
license=('MIT')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(mini-matrix)
conflicts=()
replaces=()
backup=()
options=()
install=mini-matrix.install
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "${_pkgname}"
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd mini-matrix
    make
}

package() {
    cd mini-matrix
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    
}
