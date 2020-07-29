# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=wl-clipboard-manager
pkgver=1.2.0
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
sha256sums=('c94b786697596b31b7f7e95befc28189c0a49e450727db56d7aa24e54a8edbac'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
