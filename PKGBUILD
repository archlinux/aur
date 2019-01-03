# Maintainer: Vitrum <wqdxosty1yhj@bk.ru>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=keyman-onboard
pkgver=1.4.1
pkgrel=1
pkgdesc="On-screen keyboard Onboard with patches from Keyman developers"
arch=('x86_64')
url="https://github.com/keymanapp/onboard-keyman"
license=('GPL')
depends=('gtk3' 'hunspell' 'iso-codes' 'libcanberra' 'libxkbfile' 'python-cairo' 'python-dbus' 'python-gobject' 'systemd')
makedepends=('python-distutils-extra')
optdepends=('mousetweaks: hover click with mouse')
conflicts=('onboard')
source=("$pkgname::git+https://github.com/keymanapp/onboard-keyman#branch=keymankb")
md5sums=('SKIP')

build() {
  cd $pkgname
  python3 setup.py build
}

package() {
  cd $pkgname
  python3 setup.py install --root="$pkgdir" --optimize=1
}
