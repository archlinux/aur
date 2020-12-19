# Maintainer: Denton Liu <liu.denton@gmail.com>

pkgname=tetrio-desktop
pkgver=7.0.0
pkgrel=1
pkgdesc='TETR.IO desktop client'
arch=('x86_64')
license=('custom')
url='https://tetr.io/'
source=("$pkgname-$pkgver::https://tetr.io/about/desktop/builds/TETR.IO%20Setup.deb"
        LICENSE) # https://tetr.io/about/terms/
sha256sums=('baf10aa3c974f1609e09e06c73d9f61fb99a992d25b09521739e35edcb029fd4'
            '5e721783706e2018878ca127ec6ed5d6a1298ee9cc6a853329e25fafe45265f9')

package() {
    cd "$srcdir"

    tar -xf data.tar.xz -C "$pkgdir"

    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/TETR.IO/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    chmod -R go-w "$pkgdir"
}
