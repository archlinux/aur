# Maintainer: jhossbach <julian dot hossbach at gmx dot de>

_pkgname_=fingerpaint
pkgname=${_pkgname_}-wayland
pkgver=1.2.4
pkgrel=1
pkgdesc="Fingerpaint tool with wayland dependencies"
arch=('any')
url="https://github.com/Wazzaps/fingerpaint"
license=('GPL2')
source=("${_pkgname_}-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('923ed29ee05292beae2ba1def368e7c22e8df999fdfdc76c9a2594a77c0226f0')
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
