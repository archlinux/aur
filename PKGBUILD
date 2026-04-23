# Maintainers: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
#              Ivan Feign (Aiyahhh) <ivan.feign@gmail.com>

pkgname=linux-arctis-manager
_pkgname=Linux-Arctis-Manager
pkgver=2.3.0
pkgrel=2
pkgdesc="An open-source replacement for SteelSeries GG, to manage your Arctis headset on Linux!"
arch=('x86_64')
url="https://github.com/elegos/Linux-Arctis-Manager"
license=('GPL-3.0-only')
depends=(python-pulsectl python-pyudev python-dbus-next pyside6 python-pyusb python-ruamel-yaml)
makedepends=(uv python-installer git)
checkdepends=()
source=("https://github.com/elegos/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
install="linux-arctis-manager.install"
sha256sums=('14b31654020d4904143ad333b13542145cbabc5b83121584f55296339cbb2c32')

build() {
    cd "${_pkgname}-${pkgver}"
    uv build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
