# Maintainer: Thomas Lercher <aur@tlercher.de>
# Contributor: NiNjA <heinep at gmail dot com>

_pkgname=augustus
pkgname=$_pkgname-game
pkgver=1.4.1a
pkgrel=1
pkgdesc="An enhanced re-implementation of Caesar III (Original copy required)"
arch=('i686' 'x86_64')
url="https://github.com/Keriew/augustus"
license=('AGPL')
makedepends=('cmake')
depends=('sdl2' 'sdl2_mixer')
install="$pkgname.install"
source=($pkgname.desktop $pkgname.install $url/archive/v$pkgver.tar.gz)
sha256sums=('52fd21bbd8a32cee21399c598283dfea11fa507e01e92c8344fb6e021fae0928'
            'a13556dff5011df049ec64964db94f6cfcdc0e5fb18801e190af0a95b840af75'
            'ab0f75357b07b9183d3f09a92c759f8c7016bc8ac24a3d45b0b42a63dd9b4a42')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    cmake .
    make
}

package() {
    install -Dm755 "$srcdir/$_pkgname-$pkgver/$_pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    #install -Dm664 "$srcdir/$_pkgname-$pkgver/res/julius_48.png" "$pkgdir/usr/share/pixmaps/${pkgname}48.png"
    #install -Dm664 "$srcdir/$_pkgname-$pkgver/res/julius_256.png" "$pkgdir/usr/share/pixmaps/${pkgname}256.png"
    install -Dm664 "$srcdir/$_pkgname-$pkgver/res/julius_512.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
    install -Dm664 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
