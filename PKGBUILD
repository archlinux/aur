# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: Matt Kline <matt at bitbashing dot io>

_pkgname=bodoni
pkgname=(otf-$_pkgname ttf-$_pkgname ttf-$_pkgname-variable)
pkgbase=$_pkgname-font
pkgver=2.4
pkgrel=1
pkgdesc='A serif font by indestructible type* inspired by Giambattista Bodoni'
arch=(any)
url=https://indestructibletype.com/Bodoni
license=(OFL)

_url=https://github.com/indestructible-type/Bodoni
_commit=30ce6cdc354ef179a3b72ba0f0e71826e599348c
source=($_url/archive/$_commit.tar.gz)
sha256sums=(dd11c79b83b3ec1bc6bf56c1590024e33e33e798c9a512821b6ddbb58bd6e636)

prepare() {
    rm -rf $_pkgname-$_commit
    mv Bodoni-$_commit $_pkgname-$_commit
}

package_otf-bodoni() {
    cd "$srcdir"/$_pkgname-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/otf/*.otf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        AUTHORS.txt CONTRIBUTORS.txt FONTLOG.txt README.md
}

package_ttf-bodoni() {
    cd "$srcdir"/$_pkgname-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/ttf/*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        AUTHORS.txt CONTRIBUTORS.txt FONTLOG.txt README.md
}

package_ttf-bodoni-variable() {
    cd "$srcdir"/$_pkgname-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/variable/*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        AUTHORS.txt CONTRIBUTORS.txt FONTLOG.txt README.md
}
