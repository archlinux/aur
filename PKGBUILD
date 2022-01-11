# Maintainer: Denton Liu <liu.denton@gmail.com>

pkgname=tetrio-desktop
pkgver=8.0.0
pkgrel=2
pkgdesc='TETR.IO desktop client'
arch=('x86_64')
license=('custom')
url='https://tetr.io/'
depends=('libxss')
source=("$pkgname-$pkgver::https://tetr.io/about/desktop/builds/TETR.IO%20Setup.deb"
        LICENSE) # https://tetr.io/about/terms/
sha256sums=('ae07110f88692e1485f7ef1d3ab5eff95774746631b17833e28cc09ba1a38bda'
            '5e721783706e2018878ca127ec6ed5d6a1298ee9cc6a853329e25fafe45265f9')

package() {
    cd "$srcdir"

    tar -xf data.tar.xz -C "$pkgdir"

    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/TETR.IO/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    chmod -R go-w "$pkgdir"
}
