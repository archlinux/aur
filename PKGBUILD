pkgname=ti84-evo-linux
pkgver=1.0.0
pkgrel=1
pkgdesc="Unofficial udev rules and launcher for using TI Connect Evo with the TI-84 Evo"
arch=('any')
url="https://github.com/wheat32/ti84-evo-linux"
license=('Apache-2.0')
depends=(
    'sh'
    'udev'
)
optdepends=(
    'chromium: browser to run TI Connect Evo in (any Chromium-based browser works)'
    'flatpak: run TI Connect Evo in a Flatpak browser'
    'xdg-utils: prefer the default browser when it is Chromium-based'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('123e366227098881eee054b6427abe19612533eded3f01186cd14c85ebf70147')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
