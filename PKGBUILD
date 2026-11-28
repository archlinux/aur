# Maintainer: undefined-ux <undefined_1@outlook.com>
pkgname=lumine-capture-bin
pkgver=0.5.0
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
sha256sums=('c322a5a58c658aea626e6a42e9335458e0adf7db399134a1135f7f03e6ec570e')

package() {
    cp -a --no-preserve=ownership "$srcdir/usr" "$pkgdir/"

    mv "$pkgdir/usr/share/licenses/lumine-capture" \
       "$pkgdir/usr/share/licenses/$pkgname"
}
