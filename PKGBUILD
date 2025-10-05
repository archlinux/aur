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
sha256sums=('41f9fef4e1068412912fc5012fadd55cc49044c0806705a96e5afbf04f32b5d5')

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