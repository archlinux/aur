# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>
# Contributor: robertfoster

pkgname=webplotdigitizer-bin
pkgver=4.7
_name=WebPlotDigitizer-$pkgver
pkgrel=1
pkgdesc='Tool to extract numerical data from plot images (v4, open source)'
url='https://automeris.io/v4/'
arch=('x86_64')
license=('AGPL3')
depends=('gtk3' 'libxss' 'nss')
source=("https://apps.automeris.io/downloads/${_name}-linux-x64.zip"
        "${pkgname%%-bin}.desktop")
sha512sums=('264eae05f8087b1533480a1b31b9de330287b0be8761413ac13de09b1df1d115f2acc7170a2785fc8102ded78b231962728318972a71b1f076f39e6d4f894881'
            '043bf1361524d9cc1f89c7305adc9fae0327665431cf9dae4e66cb2de3679843b28c94a9f79bfc6459f5f9eb56a02e154321a6a1ba88824e6b19340627aff9ee')

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/opt"

    cd "$srcdir"
    cp -r "${_name}-linux-x64" "$pkgdir/opt/${pkgname%%-bin}"
    ln -s "/opt/${pkgname%%-bin}/${_name}" "$pkgdir/usr/bin/${pkgname%%-bin}"

    install -Dm644 "$pkgdir/opt/${pkgname%%-bin}/resources/app/images/icon/icon.svg" "$pkgdir/usr/share/pixmaps/${pkgname%%-bin}.svg"
    install -Dm644 "${pkgname%%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%%-bin}.desktop"
}
