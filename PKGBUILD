# Maintainer: pkg_maintainer <archlinuxpackagemaintainer@gmail.com>
pkgname=stdm-git
pkgver=1.r10.82a17c5.BETA
pkgrel=1
epoch=
pkgdesc="A linux man page search engine"
arch=('x86_64')
url="https://gitlab.com/utilities-n-apps/stdm.git"
license=('GPL3')
groups=()
depends=(fzf tabulate man tldr)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(stdm-git)
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd stdm
    printf "1.r%s.%s.BETA" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd stdm
     gcc -O3 stdm.cpp -lstdc++
}

package() {
    cd stdm
    install -Dm755 a.out "${pkgdir}/usr/bin/stdm"
    install -Dm644 README.org "${pkgdir}/usr/share/doc/${pkgname}/README.org"
    install -Dm643 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

