pkgname='rum-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.7.2
pkgrel=2
pkgdesc='Game library management'
arch=('x86_64')
url='https://johncena141.eu.org:8141/johncena141/rum'
license=('GPL3')
provides=('rum')
replaces=('chad-launcher-bin')
depends=(webkit2gtk curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 libvips udev)
makedepends=()
source=(
    "${_pkgname}-${pkgver}::https://github.com/jc141x/${_pkgname}/releases/download/v${pkgver}/${_pkgname}"
    "${_pkgname}.desktop::https://raw.githubusercontent.com/jc141x/${_pkgname}/v${pkgver}/${_pkgname}.desktop"
    "${_pkgname}.svg::https://raw.githubusercontent.com/jc141x/${_pkgname}/v${pkgver}/icon.svg"
)
md5sums=('57ca94a1bf46b54c6d3eac482e495de4'
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

