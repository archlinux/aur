# Maintainer: Clint Valentine <valentine.clint@gmail.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-toytree
pkgver=1.1.5
pkgrel=1
pkgdesc="Minimalist Python tree plotting library using toyplot graphs"
arch=('any')
url="http://toytree.readthedocs.io/"
license=('GPL3')
makedepends=('python' 'python-setuptools' 'git')
depends=('python' 'python-numpy' 'python-toyplot')
options=(!emptydirs)
source=("git+https://github.com/eaton-lab/toytree#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/toytree"
  python setup.py build
}

package() {
  cd "${srcdir}/toytree"
  python setup.py install --root="${pkgdir}"/ --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
