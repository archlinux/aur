# Maintainer: Tournesol <bonjour@tournesol.me>

_name=basteleur
pkgbase=$_name-font
pkgname=(ttf-$_name otf-$_name)
_sha=f32302d63d46e9b996f329648b0f2df01c9190f5
pkgver=3.0
pkgrel=1
pkgdesc='A typeface font from Velvetyne designed with the Tarot de Marseille in mind.'
arch=('any')
url="https://velvetyne.fr/fonts/$_name"
license=('OFL-1.1')
source=("https://gitlab.com/velvetyne/$_name/-/archive/$_sha/$_name-$pkgver.tar.bz2")
sha256sums=('d3fc7ebc549d1c3b0c01e398abca471cf63e2555c9eb8334b4bd75ef95a534c8')

package_otf-basteleur() {
    provides=("$pkgbase")
    cd "$_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}

package_ttf-basteleur() {
    provides=("$pkgbase")
    cd "$_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/ttf/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
