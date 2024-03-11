# Maintainer: Denton Liu <liu.denton@gmail.com>

pkgname=tetrio-desktop
pkgver=9.0.0
pkgrel=1
pkgdesc='TETR.IO desktop client'
arch=('x86_64')
license=('custom')
url='https://tetr.io/'
depends=('libxss')
source=("$pkgname-$pkgver.deb::https://tetr.io/about/desktop/builds/${pkgver%.*.*}/TETR.IO%20Setup.deb"
        LICENSE) # https://tetr.io/about/terms/
sha256sums=('52b88bc0c07c0fefd3df61f8acf6e4240cbf17f14584da5dfbed0047597011fb'
            '5e721783706e2018878ca127ec6ed5d6a1298ee9cc6a853329e25fafe45265f9')

package() {
    cd "$srcdir"

    tar -xf data.tar.xz -C "$pkgdir"

    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/TETR.IO/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    chmod -R go-w "$pkgdir"
}
