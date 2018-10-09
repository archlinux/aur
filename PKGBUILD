# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=codespell-git
pkgver=1.14.0.r13.g85670dc
pkgrel=1
pkgdesc="Tool for fixing common misspellings in text files"
arch=('any')
url="https://github.com/codespell-project/codespell"
license=('GPL2')
depends=('python' 'python-setuptools')
makedepends=('git' 'help2man')
checkdepends=('python-pytest')
provides=('codespell')
conflicts=('codespell')
source=("git+https://github.com/codespell-project/codespell.git")
sha256sums=('SKIP')


pkgver() {
  cd "codespell"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "codespell"

  python setup.py build
  make
}

package() {
  cd "codespell"

  python setup.py install --root="$pkgdir" --optimize=1
}
