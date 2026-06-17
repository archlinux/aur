# Maintainer: Lin Evelynn <lin@sz.cn.eu.org>
pkgname=incy-bin
_pkgname=incy
pkgver=3.2.3
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

source=("${_pkgname}-${pkgver}-linux-x64.pkg.tar.zst::https://github.com/INCY-DEV/incy-platforms/releases/download/desktop-v${pkgver}/incy-linux-x64.pkg.tar.zst")

sha256sums=('e2baa80b6c957ec490f7f0732aed6005172bdca73a5ae1c35cd5b75286f9702d')

package() {
    install -dm755 "$pkgdir/opt"
    cp -a "$srcdir/opt/incy" "$pkgdir/opt/"
    install -dm755 "$pkgdir/usr"
    cp -a "$srcdir/usr/bin" "$pkgdir/usr/"
    cp -a "$srcdir/usr/share" "$pkgdir/usr/"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    echo "Proprietary. See: https://incy.cc/licenses" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
