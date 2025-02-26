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
_commit_otf=5d2a35b3d47de4e24273f64feefdc1c3bfe5528d
source=(
    $_url/archive/$_commit.tar.gz
    $_url/archive/$_commit_otf.tar.gz
)
sha256sums=(
    dd11c79b83b3ec1bc6bf56c1590024e33e33e798c9a512821b6ddbb58bd6e636
    db91c9e415328767e93782fba8d1c31f5520c2798bce09839b129a236ee66ab6
)

prepare() {
    rm -rf $_pkgname-$_commit $_pkgname-$_commit_otf
    mv Bodoni-$_commit $_pkgname-$_commit
    mv Bodoni-$_commit_otf $_pkgname-$_commit_otf
}

# NOTE: this package pulls from a commit with changes tagged for v2.3 at the
# latest. thus, otf-bodoni has pkgver=2.3
package_otf-bodoni() {
    cd "$srcdir"/$_pkgname-$_commit_otf
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
