# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: Blazej Sewera <blazejok1 at wp dot pl>

_pkgname=besley
pkgname=(otf-$_pkgname ttf-$_pkgname ttf-$_pkgname-variable)
pkgbase=$_pkgname-font
pkgver=4.0
pkgrel=1
pkgdesc='A serif font by indestructible type* inspired by designs of Robert Besley'
arch=('any')
url=https://indestructibletype.com/Besley
license=(OFL)

_url=https://github.com/indestructible-type/Besley
_commit=99d5b97fcb863c4a667571ac8f86f745c345d3ab
source=($_url/archive/$_commit.tar.gz)
sha256sums=(03d31c678510aa3446702a14a42129a225d9149c074231c8e3499ba7e3946032)

prepare() {
    rm -rf $_pkgname-$_commit
    mv Besley-$_commit $_pkgname-$_commit
}

package_otf-besley() {
    cd "$srcdir"/$_pkgname-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/otf/*.otf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        AUTHORS.txt CONTRIBUTORS.txt FONTLOG.txt README.md
}

package_ttf-besley() {
    cd "$srcdir"/$_pkgname-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/ttf/*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        AUTHORS.txt CONTRIBUTORS.txt FONTLOG.txt README.md
}

package_ttf-besley-variable() {
    cd "$srcdir"/$_pkgname-$_commit
    install -Dm644 -t "$pkgdir"/usr/share/fonts/$_pkgname fonts/variable/*.ttf
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname OFL.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname \
        AUTHORS.txt CONTRIBUTORS.txt FONTLOG.txt README.md
}

