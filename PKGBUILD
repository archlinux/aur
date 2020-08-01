# Maintainer: Soraxas <oscar AT tinyiu DOT com>

pkgname=xxh-git
pkgver=0.8.3.r3.g7bb749f
pkgrel=1
pkgdesc="Bring your favorite shell wherever you go through the ssh"
arch=('any')
url="https://github.com/xxh/xxh"
license=('BSD')
depends=('python' 'openssh' 'python-pexpect')
makedepends=('git' 'python-setuptools')
provides=('xxh')
conflicts=('xxh')
source=("git+https://github.com/xxh/xxh.git")
sha256sums=('SKIP')


pkgver() {
  cd "xxh"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "xxh"
  /bin/python3 "setup.py" install \
    --optimize 1 \
    --root "$pkgdir"
}

