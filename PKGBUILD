# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=dmenu-term
pkgver=1.1.0
pkgrel=1
license=('MIT')
pkgdesc='dmenu as a terminal with fuzzy filter'
url='https://github.com/maximbaz/dmenu-term'
arch=('any')
provides=('dmenu')
conflicts=('dmenu')
depends=('inotify-tools')
optdepends=('fzf: fuzzy filter'
            'kitty: currently supported terminal')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/maximbaz/${pkgname}/archive/${pkgver}.tar.gz"
        "https://github.com/maximbaz/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('d40627f5a25c58b41fd0e0d87b26e53db3594da0aacf872587ab6b4d10828561'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}" BIN=dmenu
}
