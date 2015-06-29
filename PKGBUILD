# Maintainer:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=flaw
pkgver=1.3.2a
pkgrel=1
pkgdesc="A free cross-platform multiplayer action game"
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net/"
license=('GPL3')
depends=('sdl' 'sdl_gfx' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'ttf-freefont')
optdepends=('wqy-zenhei: font requiered for Chinese localization')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('82d949b76b84b3217d85401365eb66c4')
sha1sums=('7860a8e7f4c9c0a974d690a5de8be293409e36f6')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make || return 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir install || return 1
}
