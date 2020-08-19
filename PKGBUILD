# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wl-clipboard-manager
pkgver=1.3.0
pkgrel=1
license=('MIT')
pkgdesc='Clipboard manager for Wayland'
url="https://github.com/maximbaz/${pkgname}"
arch=('any')
depends=('wl-clipboard'
         'dmenu-term'
         'bat'
         'fzf'
         'sqlite'
         'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/maximbaz/${pkgname}/archive/${pkgver}.tar.gz"
        "https://github.com/maximbaz/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('8297e1c3e0b9577627e263899886e6bb0ace3c884b2f2ec5114d900d86dcfa91'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
