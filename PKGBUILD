# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=robotframework-lint
pkgver=1.1.0
pkgrel=3
pkgdesc="Linter for robot framework plain text files"
arch=('any')
url="https://github.com/boakley/robotframework-lint"
urlfork="https://github.com/jstvz/robotframework-lint"
license=('Apache-2.0')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${pkgname}::git+${urlfork}#commit=a69b00851279fd3e3c729e313e5c8bce4b38f12a")
sha512sums=('fbd42f8632485720c3f52ff1ec8a4cecd662dbd9e512d5a598a94ec6cd7f7f0e7f11c40b42027c10c12072e5a46a32705fae0f7b988cdaea5c9b97754898b5df')

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
