# Maintainer: jhossbach <julian dot hossbach at gmx dot de>

_pkgname_=fingerpaint
pkgname=${_pkgname_}-wayland
pkgver=1.2
pkgrel=1
pkgdesc="Fingerpaint tool with wayland dependencies"
arch=('any')
url="https://github.com/Wazzaps/fingerpaint"
license=('GPL2')
source=("${_pkgname_}-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('4a32a607a4e7d4b38ff570016f02bbf1')
depends=('python-evdev' 'python-pillow' 'python-pyudev' 'dconf')
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
