# Maintainer: Vitrum <wqdxosty1yhj@bk.ru>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

_pkgname=onboard-keyman
pkgname=keyman-onboard
pkgver=1.4.3
pkgrel=2
pkgdesc="fork of onboard to adapt it to use it as an OSK for Keyman on Linux"
arch=('x86_64' 'armv7h' 'aarch64' 'powerpc64le')
url="https://github.com/keymanapp/onboard-keyman"
license=('GPL3+')
depends=('dbus-python' 'gtk3' 'hunspell' 'libcanberra' 'libxkbfile' 'python-cairo' 'python-gobject' 'python-lxml')
makedepends=('git' 'python-distutils-extra')
optdepends=('mousetweaks: hover click with mouse')
provides=('onboard')
conflicts=('onboard')
_commit=3582d5797402b7cd15c51efe79229b37f57ef816
source=("git+$url.git#commit=$_commit")
md5sums=('SKIP')

build() {
  cd $_pkgname
  python3 setup.py build
}

package() {
  cd $_pkgname
  python3 setup.py install --root="$pkgdir" --optimize=1
}
