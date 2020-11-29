# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>
# Contributor: robertfoster

pkgname=webplotdigitizer-bin
pkgver=4.4
_name=WebPlotDigitizer-$pkgver
pkgrel=1
pkgdesc='Tool to extract numerical data from plot images'
url='https://automeris.io/WebPlotDigitizer/'
arch=('x86_64')
license=('AGPL3')
depends=('gtk3' 'libxss' 'nss')
source=("https://automeris.io/downloads/${_name}-linux-x64.zip"
        "${pkgname%%-bin}.desktop")
sha512sums=('1a1a5ad7f8241384e842092dd0c6d797102948d196113e3a1122f7250e8978150695c87216072e9db2320e4a1255729440fe8d39497a082d0a1cea1be0cf0f05'
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
