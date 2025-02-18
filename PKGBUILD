# Maintainer: Ralph Torres <mail at ralphptorr dot es>

_pkgname=drafting
pkgname=(otf-$_pkgname ttf-$_pkgname ttf-$_pkgname-variable)
pkgbase=$_pkgname-font
pkgver=1.1
pkgrel=6
pkgdesc='A monospace font by indestructible type* inspired by typewriters'
arch=(any)
url=https://indestructibletype.com/Drafting
license=(OFL)

_url=https://github.com/indestructible-type/Drafting
_commit=c387df13576c3b541352725b021f9f99302e52d6
source=($_url/archive/$_commit.tar.gz)
sha256sums=(b058991e681672cbff83859eb5c1d29feb124c563f572782fc1ed5c31a2f4df1)

prepare() {
    rm -rf $_pkgname-$_commit
    mv Drafting-$_commit $_pkgname-$_commit
}

package_otf-drafting() {
    cd "$srcdir"/$_pkgname-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/otf/*.otf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        AUTHORS.txt CONTRIBUTORS.txt FONTLOG.txt README.md
}

package_ttf-drafting() {
    cd "$srcdir"/$_pkgname-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/ttf/*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        AUTHORS.txt CONTRIBUTORS.txt FONTLOG.txt README.md
}

package_ttf-drafting-variable() {
    cd "$srcdir"/$_pkgname-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/variable/*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        AUTHORS.txt CONTRIBUTORS.txt FONTLOG.txt README.md
}
