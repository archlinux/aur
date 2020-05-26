# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wl-clipboard-manager
pkgver=1.1.0
pkgrel=1
license=('MIT')
pkgdesc='Clipboard manager for Wayland'
url="https://github.com/maximbaz/${pkgname}"
arch=('any')
depends=('wl-clipboard'
         'dmenu-term'
         'bat'
         'fzf'
         'fdupes')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/maximbaz/${pkgname}/archive/${pkgver}.tar.gz"
        "https://github.com/maximbaz/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('f1e31febf642e80d4d7cf51f8629816e9873e9555a462a54f7982d7a9da0ef95'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
