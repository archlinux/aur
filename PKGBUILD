# Maintainer: rhssk
pkgname=when-changed-git
pkgver=0.r62.7a2df66
pkgrel=1
pkgdesc="Execute a command when a file is changed."
arch=('any')
url="https://github.com/joh/when-changed"
license=('BSD')
depends=('python' 'python-watchdog')
makedepends=('git')
provides=(when-changed)
conflicts=(when-changed)
source=('git+https://github.com/joh/when-changed.git')
sha256sums=('SKIP')

pkgver() {
  cd when-changed
  echo "0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd when-changed
  python setup.py install --root="$pkgdir" --optimize=1
}
