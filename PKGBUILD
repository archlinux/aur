# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=catacombsdl
pkgver=1.03
pkgrel=1
pkgdesc="SDL2 source port for Catacomb II / The Catacomb"
arch=('i686' 'x86_64')
url="https://github.com/Blzut3/CatacombSDL"
license=('GPL2')
depends=('sdl2')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/Blzut3/CatacombSDL/archive/$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname.png")
sha256sums=('8c77d2a82448e163c80971015ace425dabbe1831a647d6034d270dd6892343d8'
            'c042d617739a3c63bf0696bda95d48cc34598592db091b832130f552726950dd'
            'e0bda5ad8ed14469d5329283240c189f72a4beeed7e34fd82cb54604305f5664'
            'b2b305edc0fa7c4e9f884987040ca20e4f2124719ffdb27ad322bc9257def67b')

build() {
  cd CatacombSDL-$pkgver

  cmake ./
  make
}

package() {
  cd CatacombSDL-$pkgver

  # install executable
  install -Dm755 catacomb "$pkgdir"/usr/share/$pkgname/catacomb

  # install launcher, icon and desktop files
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 ../$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
