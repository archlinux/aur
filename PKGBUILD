pkgname=pwg-git
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="random password generator"
arch=(x86_64 i686)
url="https://github.com/systemb4/pwg"
license=('GPL')
groups=()
depends=()
makedepends=(git gcc)
checkdepends=()
optdepends=()
provides=(pwg)
conflicts=(pwg)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
    cd pwg
    make
}

package() {
    cd pwg
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}
