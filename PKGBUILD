# Maintainers: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=linux-arctis-manager
_pkgname=Linux-Arctis-Manager
pkgver=2.1.0
pkgrel=3
pkgdesc="A replacement for SteelSeries GG software, to manage your Arctis device on Linux!"
arch=('x86_64')
url="https://github.com/elegos/Linux-Arctis-Manager"
license=('GPL-3.0-only')
depends=(python-pulsectl python-pyudev python-dbus-next pyside6 python-pyusb python-ruamel-yaml)
makedepends=(uv python-installer git)
checkdepends=()
source=("https://github.com/elegos/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
install="linux-arctis-manager.install"
sha256sums=('3111a44df81c7560a4d3211361f4120a560572f05eda62953974ff3e5df42e41')

build() {
    cd "${_pkgname}-${pkgver}"
    uv build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
