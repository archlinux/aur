# Maintainer: E-Hern Lee <ehern.lee@gmail.com>

pkgname=gargoyle-bin
pkgver=2022.1
pkgrel=1
pkgdesc="AppImage for Interactive Fiction multi-interpreter that supports all major IF formats."
license=('GPL')
conflicts=('gargoyle' 'gargoyle-git')
url="https://github.com/garglk/garglk"
arch=('any')
_pkgname=${pkgname//-bin/}
options=(!strip) # required for AppImages
source=("${_pkgname}-${pkgver}::https://github.com/garglk/garglk/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.AppImage")
sha512sums=('ae2e4bcc66fced986552e5731a4ebb55058933ed1d2b1eae9652cf16488884e95d10f7c0b913f7ae30c6b20e9d3da00d04ab174ed3d10c2dac1f9e4c1a8c0f6c')

package() {
    install -Dm 755 "$srcdir/${_pkgname}-${pkgver}" "$pkgdir/usr/bin/${_pkgname}"
}
