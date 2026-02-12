# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=linux-arctis-manager
_pkgname=Linux-Arctis-Manager
pkgver=r110.55b4cb9
pkgrel=1
pkgdesc="A replacement for SteelSeries GG software, to manage your Arctis device on Linux!"
arch=('x86_64')
url="https://github.com/elegos/Linux-Arctis-Manager"
license=('GPL-3.0-only')
depends=(python-pulsectl python-pyudev)
makedepends=(python-pipenv uv)
checkdepends=()
source=("git+https://github.com/elegos/$_pkgname")
install="linux-arctis-manager.install"
sha256sums=('SKIP')

pkgver(){
	cd "$_pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	uv build
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl

}

