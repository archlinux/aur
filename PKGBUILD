# Maintainer: Lin Evelynn <lin@sz.cn.eu.org>
pkgname=incy-bin
_pkgname=incy
pkgver=3.2.0
pkgrel=1
pkgdesc="Cross-platform proxy client built on Xray-core"
arch=('x86_64')
url="https://incy.cc/"
license=('LicenseRef-proprietary')
depends=('glibc' 'hicolor-icon-theme' 'fontconfig' 'libx11'
         'libxext' 'libxrender' 'libxtst' 'libxi' 'alsa-lib'
         'gcc-libs' 'libglvnd')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')

source=("https://github.com/INCY-DEV/incy-platforms/releases/download/desktop-v${pkgver}/incy-linux-x64.pkg.tar.zst")

sha256sums=('fd7ccfab466a9726d71a88acee2c0a3c2ba6a8d9cfee652c57cbf6e4fdeaaace')

package() {
    install -dm755 "$pkgdir/opt"
    cp -a "$srcdir/opt/incy" "$pkgdir/opt/"
    install -dm755 "$pkgdir/usr"
    cp -a "$srcdir/usr/bin" "$pkgdir/usr/"
    cp -a "$srcdir/usr/share" "$pkgdir/usr/"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    echo "Proprietary. See: https://incy.cc/licenses" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
