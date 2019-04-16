# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>

_name=WebPlotDigitizer
pkgname=webplotdigitizer-bin
pkgver=4.1
pkgrel=1
pkgdesc='Tool to extract numerical data from plot images'
url='https://automeris.io/WebPlotDigitizer/'
arch=('x86_64')
license=('AGPL3')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
source=("https://automeris.io/downloads/${_name}-$pkgver-linux-x64.zip"
        "${pkgname%%-bin}.desktop")
md5sums=('6d6b74f94f5922cfe9b24a1dbe035edd'
         'bbb5539842f94b8e986ba31c5f564003')
sha256sums=('7cfffa19d160c07df71121fe005fdcdb1fdd48dd3e70fb391dcbe5ca529bafd8'
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
