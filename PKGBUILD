# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=steamfootbridge
pkgname=steamfootbridge-git
pkgver=r25.eb908b4
pkgrel=1
pkgdesc="Allows running Steam applications in WINE, while using the native Steam client."
url="https://github.com/sirnuke/steamfootbridge"
makedepends=('git' 'python-setuptools')
depends=('python-steamodd')
provides=('steamfootbridge')
conflicts=('steamfootbridge')
replaces=('steambridge')
license=('MIT')
arch=('any')
source=("git+https://github.com/sirnuke/steamfootbridge.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	python3 setup.py build
}

package() {
	cd "${_pkgname}"
	python3 setup.py install --root="$pkgdir/" --optimize=1
}
