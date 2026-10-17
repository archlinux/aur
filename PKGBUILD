# Maintainer: undefined-ux <undefined_1@outlook.com>
pkgname=lumine-capture-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Screenshot and annotation tool for Wayland with built-in OCR (prebuilt)'
arch=('x86_64')
url='https://github.com/Netflate/LumineCapture'
license=('MIT OR Apache-2.0' 'OFL-1.1')
depends=(gcc-libs glibc libpipewire libxkbcommon openssl zlib)
provides=("lumine-capture=$pkgver")
conflicts=('lumine-capture')
options=(!debug !strip)

_pkgfile="lumine-capture-${pkgver}-1-x86_64.pkg.tar.zst"
source=("$_pkgfile::$url/releases/download/v$pkgver/$_pkgfile")
sha256sums=('4ef592afdc458555c3ab382cab7febff5c4e1d64bbcc5e374a70f588e8c7c67b')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"

    mv "$pkgdir/usr/share/licenses/lumine-capture" \
       "$pkgdir/usr/share/licenses/$pkgname"
}
