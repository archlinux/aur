# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Morten Linderud <foxboron@archlinux.org>

pkgname=smenu
pkgver=0.9.18
pkgrel=1
pkgdesc="A powerful and versatile selection tool for interactive or scripting use"
arch=('x86_64')
url="https://github.com/p-gen/smenu"
license=('GPL')
depends=('ncurses')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/p-gen/smenu/archive/v${pkgver}.tar.gz")
sha256sums=('08d4f58edb432522da61f94372a78c812a1fee324a31a60f432283715fa56d37')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix="/usr"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
