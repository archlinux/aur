# Maintainer: undefined-ux <undefined_1@outlook.com>
pkgname=lumine-capture-bin
pkgver=0.2.0
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
sha256sums=('2f39fac82243e8d4070b4a3b3698d14bf34d085efa9ff412b0919a93dabc9166')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"

    mv "$pkgdir/usr/share/licenses/lumine-capture" \
       "$pkgdir/usr/share/licenses/$pkgname"
}
