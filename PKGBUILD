# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wl-clipboard-manager
pkgver=1.0.0
pkgrel=1
license=('MIT')
pkgdesc='Clipboard manager for Wayland'
url="https://github.com/maximbaz/${pkgname}"
arch=('any')
depends=('wl-clipboard'
         'dmenu-term'
         'viu'
         'bat'
         'fzf'
         'fdupes')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/maximbaz/${pkgname}/archive/${pkgver}.tar.gz"
        "https://github.com/maximbaz/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('81fad3401dd7c4a8797fdc7bae04097f3df2cb2e88b037025964bbb53630d35c'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
