# Maintainer: Lin Evelynn <lin@sz.cn.eu.org>
pkgname=incy-bin
_pkgname=incy
pkgver=3.3.0
pkgrel=1
pkgdesc="Cross-platform proxy client built on Xray-core"
arch=('x86_64')
url="https://incy.cc/"
license=('LicenseRef-proprietary')
depends=('glibc' 'hicolor-icon-theme' 'fontconfig' 'libx11'
         'libxext' 'libxrender' 'libxtst' 'libxi' 'alsa-lib'
         'gcc-libs' 'libglvnd' 'polkit')
optdepends=('iptables: kill switch support'
            'libnotify: desktop notifications'
            'python-gobject: Wayland tray support'
            'libayatana-appindicator: Wayland tray support')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')

source=("${_pkgname}-${pkgver}-linux-x64.pkg.tar.zst::https://github.com/INCY-DEV/incy-platforms/releases/download/desktop-v${pkgver}/incy-linux-x64.pkg.tar.zst")

sha256sums=('8e5b099e9bd720910a5e0cc2f7f2c85438963280a78a91c881973f3241b64fa4')

package() {
    install -dm755 "$pkgdir/opt"
    cp -a --no-preserve=ownership "$srcdir/opt/incy" "$pkgdir/opt/"
    install -dm755 "$pkgdir/usr"
    cp -a --no-preserve=ownership "$srcdir/usr/bin" "$pkgdir/usr/"
    cp -a --no-preserve=ownership "$srcdir/usr/share" "$pkgdir/usr/"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    echo "Proprietary. See: https://incy.cc/licenses" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
