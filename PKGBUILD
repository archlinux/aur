# Maintainer: xihale <xihale.top@qq.com>

pkgname="v2rayn-bin"
pkgver=7.2.3
pkgrel=1
pkgdesc="A GUI client for Windows and Linux, support Xray core and others"
arch=("x86_64")
license=('GPL3')
url="https://github.com/2dust/v2rayN"
source=("https://github.com/2dust/v2rayN/releases/download/${pkgver}/v2rayN-linux-64.zip" "v2rayN.png" "v2rayN-bin.desktop")
options=('!strip') # TODO: after striping, it cannot run

package() {

    _app_name=$pkgname

    install -Dm644 "../v2rayN.png" -t "$pkgdir/usr/share/pixmaps"
    install -Dm644 "../v2rayN-bin.desktop" -t "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/opt/$_app_name"
    mv v2rayN-linux-64/* $pkgdir/opt/$_app_name/
    chmod -R 0777 $pkgdir/opt/$_app_name

}
sha256sums=('83ac5b96c17ca927d7f8e3d1daf98d55376dc6b9e327862983b0a11be645023f'
            'f762fd95d93c2287f55ebb742716a54aa6b507ff8c8d75aec7256fabc93192ee'
            'c3193fc83a87c6a0c7bd10fbfc2cbbd568d33bc33be0b8e6b3773e6207a8b07d')
