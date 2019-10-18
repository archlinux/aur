# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>
# Contributor: robertfoster

pkgname=webplotdigitizer-bin
pkgver=4.2
_name=WebPlotDigitizer-$pkgver
pkgrel=3
pkgdesc='Tool to extract numerical data from plot images'
url='https://automeris.io/WebPlotDigitizer/'
arch=('x86_64')
license=('AGPL3')
depends=('gtk3' 'libxss' 'nss')
source=("https://automeris.io/downloads/${_name}-linux-x64.zip"
        "${pkgname%%-bin}.desktop")
md5sums=('0a903a3ed00cf2d3729d09f13d86101c'
         'bbb5539842f94b8e986ba31c5f564003')
sha256sums=('fab2621c808b95fce6ffd7a120b156694370193d58fdc0118c4e23d418cf2d29'
            '30ddc4aef0b82c9b22dc9aeb9dbacd7cf3dd60cd1805cdc9db01da3db9a1ceef')

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/opt"

    cd "$srcdir"
    cp -r "${_name}-linux-x64" "$pkgdir/opt/${pkgname%%-bin}"
    ln -s "/opt/${pkgname%%-bin}/${_name}" "$pkgdir/usr/bin/${pkgname%%-bin}"

    install -Dm644 "$pkgdir/opt/${pkgname%%-bin}/resources/app/images/icon/icon.svg" "$pkgdir/usr/share/pixmaps/${pkgname%%-bin}.svg"
    install -Dm644 "${pkgname%%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%%-bin}.desktop"
}
