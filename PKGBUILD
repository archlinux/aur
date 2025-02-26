# Maintainer: Ralph Torres <mail at ralphptorr dot es>

_pkgname=cooper
pkgname=(otf-$_pkgname ttf-$_pkgname ttf-$_pkgname-variable)
pkgbase=$_pkgname-font
pkgver=1.0
pkgrel=1
pkgdesc='A serif font by indestructible type* that is a historically accurate revival of the Cooper series'
arch=(any)
url=https://indestructibletype.com/Cooper
license=(OFL)

_url=https://github.com/indestructible-type/Cooper
_commit=f701c1780f4bc2c0d6a2f387f0c151b71405c512
source=($_url/archive/$_commit.tar.gz)
sha256sums=('7f23a8c81ff09cd90387288f591b62e9e46060ab5ce0bb00c1af21583b630af4')

prepare() {
    rm -rf $_pkgname-$_commit
    mv Cooper-$_commit $_pkgname-$_commit
}

package_otf-cooper() {
    cd "$srcdir"/$_pkgname-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/otf/*.otf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        CONTRIBUTORS.txt README.md
}

package_ttf-cooper() {
    cd "$srcdir"/$_pkgname-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/ttf/*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        CONTRIBUTORS.txt README.md
}

package_ttf-cooper-variable() {
    cd "$srcdir"/$_pkgname-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/variable/*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        CONTRIBUTORS.txt README.md
}
