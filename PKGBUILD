# Maintainer: Denton Liu <liu.denton@gmail.com>

pkgname=tetrio-desktop
pkgver=6.0.0
pkgrel=1
pkgdesc='TETR.IO desktop client'
arch=('x86_64')
license=('custom')
url='https://tetr.io/'
source=("$pkgname-$pkgver::https://tetr.io/about/desktop/builds/TETR.IO%20Setup.deb"
        LICENSE) # https://tetr.io/about/terms/
sha256sums=('2dca3443c0b4353a951ccdfb1f184d56328d8d9bf03777619dbb03fb868b5607'
            '5e721783706e2018878ca127ec6ed5d6a1298ee9cc6a853329e25fafe45265f9')

package() {
    cd "$srcdir"

    tar -xf data.tar.xz -C "$pkgdir"

    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/TETR.IO/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    chmod -R go-w "$pkgdir"
}
