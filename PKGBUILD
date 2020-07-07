# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>
# Contributor: robertfoster

pkgname=webplotdigitizer-bin
pkgver=4.3
_name=WebPlotDigitizer-$pkgver
pkgrel=3
pkgdesc='Tool to extract numerical data from plot images'
url='https://automeris.io/WebPlotDigitizer/'
arch=('x86_64')
license=('AGPL3')
depends=('gtk3' 'libxss' 'nss')
source=("https://automeris.io/downloads/${_name}-linux-x64.zip"
        "${pkgname%%-bin}.desktop")
sha512sums=('31b8f1da0d101157e771a85a38c64bc1369d6278915d6d4dff2551ad86486767ff18a6c68c0cddd120e6a3e1b4d57a51f053beb823f2b9474ee4659b4ae14e19'
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
