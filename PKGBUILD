# Maintainer: iam-vasanth <vk.vasanth.r@mail.com>

pkgname=plymouth-theme-monoarch-refined
pkgver=1.0.0
pkgrel=1
pkgdesc="Refined Plymouth boot theme based on Monoarch with centered layout and clean password prompt"
arch=('any')
url="https://github.com/iam-vasanth/monoarch-refined"
license=('MIT')
depends=('plymouth')
optdepends=(
    'cantarell-fonts: Recommended font for clean text rendering'
    'ttf-dejavu: Alternative font for text rendering'
)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/iam-vasanth/monoarch-refined/archive/v$pkgver.tar.gz")
sha256sums=('0b96b7e5258993808723cafaddc813712a24e2f85e74f22daea57766e294be4b')

package() {
    cd "$srcdir/monoarch-refined-$pkgver"
    
    # Install theme files
    install -d "$pkgdir/usr/share/plymouth/themes/monoarch-refined"
    cp -r images "$pkgdir/usr/share/plymouth/themes/monoarch-refined/"
    install -Dm644 monoarch-refined.plymouth "$pkgdir/usr/share/plymouth/themes/monoarch-refined/"
    install -Dm644 monoarch-refined.script "$pkgdir/usr/share/plymouth/themes/monoarch-refined/"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
