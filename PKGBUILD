# Maintainer: Simon Doppler <dopsi[at]dopsi[dot]ch>

_archive_name=fonts
_pkgver=2015-12-04

pkgname=powerline-console-fonts
pkgver="${_pkgver//-/}"
pkgrel=1
pkgdesc="Various powerline patched fonts for the text console"
arch=('any')

url="https://github.com/powerline/fonts"
license=('MIT')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/powerline/fonts/archive/${_pkgver}.tar.gz"
    "https://raw.githubusercontent.com/powerline/powerline/develop/LICENSE"
)
sha512sums=('d50ba53c4202c7f7856e4f7af30771c3fff33812df81886fd6027a94c3b54148928f3b2d4d36bd83425f46e6d8a3f2f23ee5761623e225155410e8c5aa0c5628'
            '837073c64e267a322b14ec88915c8583a3dbe4a60fd92e306402a3f0eddb147ff41f9860d257f3d5e32b0ee4db39b299fb3b7bbe59d6e6f102ec778cebe0bda4')

package() {
    cd "$srcdir/${_archive_name}-${_pkgver}"
    find -name "*.psf*" -print0 | xargs -0 install -D -t "$pkgdir/usr/share/kbd/consolefonts"
    install -D -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE"
}
