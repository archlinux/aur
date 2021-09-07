# Maintainer: jhossbach <julian dot hossbach at gmx dot de>

_pkgname_=fingerpaint
pkgname=${_pkgname_}-wayland
pkgver=1.2.2
pkgrel=1
pkgdesc="Fingerpaint tool with wayland dependencies"
arch=('any')
url="https://github.com/Wazzaps/fingerpaint"
license=('GPL2')
source=("${_pkgname_}-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('5e79807fef6b011f381e90866981a185')
depends=('python-evdev' 'python-pillow' 'python-pyudev' 'dconf' 'tk')
makedepends=('python-setuptools')
provides=("${_pkgname_}")
conflicts=("${_pkgname_}")

build() {
    cd "${_pkgname_}-$pkgver"
    python setup.py build
}

package() {
    cd "${_pkgname_}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
