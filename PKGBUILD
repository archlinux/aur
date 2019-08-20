# Maintainer: Adrian Petrescu <adrian@apetre.sc>
# Contributor: Adrian Petrescu <adrian@apetre.sc>

pkgname=yada
pkgver=0.9.2
pkgrel=1
pkgdesc='Yet another dotfile aggregator'
arch=(any)
url=https://github.com/apetresc/yada
license=(MIT)
depends=(
  'python-click>=7' 'python-click<8'
  'python-setuptools'
  'python-yaml'
)
makedepends=(
  git
)
source=(
  git+https://github.com/apetresc/yada.git#tag=v${pkgver}
)
sha256sums=(
  'SKIP'
)

build() {
  cd ${pkgname}

  python setup.py build sdist
}

package() {
  cd ${pkgname}

  python setup.py install --root="${pkgdir}"
}
