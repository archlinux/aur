# Maintainer: Ralph Torres <mail at ralphptorr dot es>

_pkgname=marauder
pkgname=(otf-$_pkgname ttf-$_pkgname ttf-$_pkgname-variable)
pkgbase=$_pkgname-font
pkgver=1.1
pkgrel=1
pkgdesc="A serif font by indestructible type* inspired by children's books" 
arch=(any)
url=https://indestructibletype.com/Marauder
license=(OFL-1.1)

source=($url/Marauder.zip)
sha256sums=(84215a70e40aa28b4a6001044a639a0b053f09da8ae1c4dc9d1e3a29d4bb1162)

prepare() {
    cd "$srcdir"
    rm -rf $_pkgname-$pkgver
    mkdir -p $_pkgname-$pkgver
    mv otf ttf variable webfonts LICENSE.md $_pkgname-$pkgver/
}

package_otf-marauder() {
    cd "$srcdir"/$_pkgname-$pkgver
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname otf/*.otf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.md
}

package_ttf-marauder() {
    cd "$srcdir"/$_pkgname-$pkgver
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname ttf/*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.md
}

package_ttf-marauder-variable() {
    cd "$srcdir"/$_pkgname-$pkgver
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname variable/*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.md
}
