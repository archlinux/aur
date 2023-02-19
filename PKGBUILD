# Maintainer: rhssk
pkgname=when-changed-git
pkgver=0.3.0.r37.g85d7acc
pkgrel=1
pkgdesc="Execute a command when a file is changed."
arch=('any')
url="https://github.com/joh/when-changed"
license=('BSD')
depends=('python' 'python-watchdog' 'python-setuptools')
makedepends=('git')
provides=(when-changed)
conflicts=(when-changed)
source=('git+https://github.com/joh/when-changed.git')
sha256sums=('SKIP')

pkgver() {
  cd when-changed
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd when-changed
  python setup.py install --root="$pkgdir" --optimize=1
}
