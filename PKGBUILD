# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Morten Linderud <foxboron@archlinux.org>

pkgname=smenu
pkgver=1.3.0
pkgrel=1
pkgdesc="A powerful and versatile selection tool for interactive or scripting use"
arch=('x86_64')
url="https://github.com/p-gen/smenu"
license=('GPL')
depends=('ncurses')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/p-gen/smenu/archive/v${pkgver}.tar.gz")
sha256sums=('f69480f98e0bb42f3465a303a109c968ad29e6757a6fb94595ded61b4896ad3e')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix="/usr"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
