# Maintainer: Victor Bayas <victorsbayas at gmail dot com>
# Contributor: Victor Bayas <victorsbayas at gmail dot com>

pkgname=envycontrol
pkgver=3.4.0
pkgrel=1
pkgdesc="CLI tool for Nvidia Optimus graphics mode switching on Linux"
arch=('any')
url="https://github.com/bayasdev/envycontrol"
license=('MIT')
depends=('python' 'xorg-xrandr')
makedepends=('python-setuptools' 'git')
conflicts=('optimus-manager')
source=("git+https://github.com/bayasdev/envycontrol.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/envycontrol/"

  python setup.py install --root="$pkgdir/" --optimize=1

  # Copy package license to system
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
