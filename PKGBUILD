# Maintainer: Lin Evelynn <lin@sz.cn.eu.org>
pkgname=incy-bin
_pkgname=incy
pkgver=2.0.8
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

source=("https://github.com/INCY-DEV/incy-platforms/releases/download/desktop-v2.0.8/incy-linux-x64.pkg.tar.zst")

sha256sums=('109de381d46255a2f2f085269319c3a916b6fd36127299fc40d10fe9e7695799')

package() {
    install -dm755 "$pkgdir/opt"
    cp -a "$srcdir/opt/incy" "$pkgdir/opt/"
    install -dm755 "$pkgdir/usr"    
    cp -a "$srcdir/usr/bin" "$pkgdir/usr/"
    cp -a "$srcdir/usr/share" "$pkgdir/usr/"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    echo "Proprietary. See: https://incy.cc/licenses" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
