# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Morten Linderud <foxboron@archlinux.org>

pkgname=smenu
pkgver=0.9.16
pkgrel=1
pkgdesc="Terminal utility that reads words from stdin or a file and creates an interactive
selection window at the cursor location without clearing the screen"
arch=('x86_64')
url="https://github.com/p-gen/smenu"
license=('GPL')
depends=('ncurses')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/p-gen/smenu/archive/v${pkgver}.tar.gz")
sha256sums=('8db8026a8d95f01b9a4b775834432b15cfd248868ef2a2ec1232bd534d26dc09')

build() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix="/usr"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
