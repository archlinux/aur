# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=GnuMICR
pkgname=${_pkgname,,}
pkgver=0.30
pkgrel=3
pkgdesc='An open-source licensed Type 1 MICR E13-B font'
arch=(any)
# url="https://sandeen.net/$_pkgname/"
url="https://github.com/alerque/$pkgname"
license=('GPL2')
# _archive="$_pkgname-$pkgver"
_archive="$pkgname-$pkgver"
# source=("$url/download/$_archive.tar.gz")
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('e087b0a85d1e5aa1ed4b11ae8f5716ec74e48ab4ca1b10b7fbba0dff6784b39b')

package() {
    cd "$_archive"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" $_pkgname.ttf
    install -Dm0644 -t "$pkgdir/usr/share/fonts/Type1/" $_pkgname.pfb $_pkgname.pfm $_pkgname.afm
    install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" $_pkgname.otf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING AUTHORS
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" CHANGELOG README NEWS
}
