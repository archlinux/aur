# Maintainer: Clint Valentine <valentine.clint@gmail.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-custom_inherit
pkgver=2.2.2
pkgrel=1
pkgdesc="Python package that provides tools for inheriting docstrings in customizable ways"
arch=('any')
url="https://github.com/meowklaski/custom_inherit"
license=('MIT')
depends=('python')
makedepends=('python' 'python-setuptools' 'git')
options=(!emptydirs)
source=("git+https://github.com/meowklaski/custom_inherit#tag=v${pkgver}")
sha256sums=('SKIP')

build(){
  cd "${srcdir}"/custom_inherit
  python setup.py build
}

package() {
  cd "${srcdir}"/custom_inherit
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build

  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/License
}
