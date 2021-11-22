pkgname='rum-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.6.0
pkgrel=1
pkgdesc='Game library management'
arch=('x86_64')
url='https://notabug.org/johncena141/rum'
license=('GPL3')
provides=('rum')
replaces=('chad-launcher-bin')
depends=(webkit2gtk curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 libvips udev)
makedepends=()
source=(
    "$_pkgname-$pkgver::https://notabug.org/attachments/fc19d811-cb81-4d18-bf11-5195cbb895b4"
    "${_pkgname}.desktop::https://notabug.org/johncena141/${_pkgname}/raw/v${pkgver}/${_pkgname}.desktop"
    "${_pkgname}.svg::https://notabug.org/johncena141/${_pkgname}/raw/v${pkgver}/icon.svg"
)
md5sums=('dffb62677f8a8780dec099fd7884471b'
         'cf6b34f87f20f6d7cb9385c2024e359a'
         '2026d2262f6f8c02881dcb53c6363064')

prepare() {
    cd $srcdir
    mv $_pkgname-$pkgver ${_pkgname%-$pkgver}
}
package() {
    cd $srcdir
    install -Dm0755 -t "$pkgdir/usr/bin/" "${_pkgname%-$pkgver}"
    install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 ${_pkgname}.svg "$pkgdir/usr/share/pixmaps/${_pkgname}.svg"
}

