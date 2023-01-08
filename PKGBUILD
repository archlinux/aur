# Maintainer: jmcb <joelsgp@protonmail.com>

pkgname=python-picotool-git
_name=picotool
pkgver=0.1
pkgrel=1
pkgdesc="Tools and Python libraries for manipulating Pico-8 game files."
arch=('any')
url="https://github.com/dansanderson/picotool"
license=('MIT')
depends=('python' 'python-pypng')
makedepends=('git' 'python-pytest-runner')
checkdepends=('flake8' 'mypy' 'python-pytest')
optdepends=()
provides=("${pkgname%-git}" 'p8tool')
conflicts=("${pkgname%-git}")
source=("git+https://github.com/dansanderson/picotool.git")
sha256sums=('SKIP')

build() {
  cd "$_name"
  python setup.py build
}

# check() {
#   cd "$_name"
#   pytest
# }

package() {
  cd "$_name"
  python setup.py install --root="$pkgdir" --optimize=1
}
