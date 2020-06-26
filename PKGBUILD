# Maintainer:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=flaw
pkgver=1.3.2a
pkgrel=2
pkgdesc="A free cross-platform multiplayer action game"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/flaw/"
license=('GPL3')
depends=('sdl' 'sdl_gfx' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'gnu-free-fonts')
optdepends=('wqy-zenhei: font requiered for Chinese localization')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('82d949b76b84b3217d85401365eb66c4')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make || return 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir install || return 1
}
