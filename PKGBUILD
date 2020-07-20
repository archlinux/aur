# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pysorter-git
pkgver=0.4.4.r3.g8b4cf72
pkgrel=1
pkgdesc='A command line utility for organizing files and directories according to regex patterns'
arch=('any')
url='https://github.com/chriscz/pysorter'
license=('MPL2')
conflicts=('pysorter')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname%-git}::git+https://github.com/chriscz/pysorter")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et: