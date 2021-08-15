# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>
# Contributor: robertfoster

pkgname=webplotdigitizer-bin
pkgver=4.5
_name=WebPlotDigitizer-$pkgver
pkgrel=1
pkgdesc='Tool to extract numerical data from plot images'
url='https://automeris.io/WebPlotDigitizer/'
arch=('x86_64')
license=('AGPL3')
depends=('gtk3' 'libxss' 'nss')
source=("https://automeris.io/downloads/${_name}-linux-x64.zip"
        "${pkgname%%-bin}.desktop")
sha512sums=('e3712c2ade930a39c82e1cd430e74b844742089f9f0e2a7e702b45472538d64e601d73890cd407146c155b33e02ed5d7832f20856a79d7981552bc3275bbe9ab'
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
