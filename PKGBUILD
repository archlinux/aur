# Maintainer: Vitrum <wqdxosty1yhj@bk.ru>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

_pkgname=onboard-keyman
pkgname=keyman-onboard
pkgver=1.4.3
pkgrel=3
pkgdesc="fork of onboard to adapt it to use it as an OSK for Keyman on Linux"
arch=('x86_64' 'armv7h' 'aarch64' 'powerpc64le')
url="https://github.com/keymanapp/onboard-keyman"
license=('GPL3')
depends=('dbus-python' 'gtk3' 'hunspell' 'libcanberra' 'libxkbfile' 'python-cairo' 'python-gobject' 'python-lxml')
makedepends=('python-distutils-extra')
optdepends=('mousetweaks: hover click with mouse')
provides=('onboard')
conflicts=('onboard')
source=("https://launchpad.net/~keymanapp/+archive/ubuntu/keyman/+sourcefiles/$_pkgname/$pkgver+onboard1.4.1-5.0~lunar/${_pkgname}_$pkgver+onboard1.4.1.orig.tar.gz")
sha256sums=('fd7561cc296f64bff3e87ef35f3a7fa905e749e58940dd4e7c26e6ceee5108db')

build() {
  cd $_pkgname-$pkgver+onboard1.4.1
  python3 setup.py build
}

package() {
  cd $_pkgname-$pkgver+onboard1.4.1
  python3 setup.py install --root="$pkgdir" --optimize=1
}
