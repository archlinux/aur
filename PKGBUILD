pkgname='rum-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.7.1
pkgrel=1
pkgdesc='Game library management'
arch=('x86_64')
url='https://johncena141.eu.org:8141/johncena141/rum'
license=('GPL3')
provides=('rum')
replaces=('chad-launcher-bin')
depends=(webkit2gtk curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 libvips udev)
makedepends=()
source=(
    "$_pkgname-$pkgver::https://johncena141.eu.org:8141/attachments/3e9bd772-1749-49f6-a2ac-7571780e2665"
    "${_pkgname}.desktop::https://johncena141.eu.org:8141/johncena141/${_pkgname}/raw/v${pkgver}/${_pkgname}.desktop"
    "${_pkgname}.svg::https://johncena141.eu.org:8141/johncena141/${_pkgname}/raw/v${pkgver}/icon.svg"
)
md5sums=('6fecb42a7bf8d6748ed1df25bc822b67'
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

