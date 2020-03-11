# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=GnuMICR
pkgname=${_pkgname,,}
pkgver=0.30
pkgrel=2
pkgdesc='An open-source licensed Type 1 MICR E13-B font'
arch=('any')
url="https://sandeen.net/$_pkgname/"
license=('GPL2')
source=("https://sandeen.net/$_pkgname/download/$_pkgname-$pkgver.tar.gz")
sha256sums=('4c485361e07e1eb0e09524726bf3d08a0e268dc41c6810dba49a5b45cbe432db')

package() {
    cd "$_pkgname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" $_pkgname.ttf
    install -Dm644 -t "$pkgdir/usr/share/fonts/Type1/" $_pkgname.pfb $_pkgname.pfm $_pkgname.afm
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" $_pkgname.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING AUTHORS
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" CHANGELOG README NEWS
}
