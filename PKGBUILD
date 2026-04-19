# Maintainer: Lin Evelynn <lin@sz.cn.eu.org>
pkgname=incy-bin
_pkgname=incy
pkgver=2.1.1
pkgrel=1
pkgdesc="Cross-platform proxy client built on Xray-core"
arch=('x86_64')
url="https://incy.cc/"
license=('LicenseRef-proprietary')
depends=('glibc' 'zlib' 'hicolor-icon-theme' 'fontconfig' 'libx11'
         'libxext' 'libxrender' 'libxtst' 'libxi' 'alsa-lib'
         'gcc-libs' 'libglvnd')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')

source=("https://github.com/INCY-DEV/incy-platforms/releases/download/desktop-v${pkgver}/incy-linux-x64.pkg.tar.zst")

sha256sums=('ba59fe2bb86f4b80311a2ecbb05787b0443b6d76dc9e95eeab8cdfeb92e878fc')

package() {
    install -dm755 "$pkgdir/opt"
    cp -a "$srcdir/opt/incy" "$pkgdir/opt/"
    install -dm755 "$pkgdir/usr"
    cp -a "$srcdir/usr/bin" "$pkgdir/usr/"
    cp -a "$srcdir/usr/share" "$pkgdir/usr/"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    echo "Proprietary. See: https://incy.cc/licenses" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
