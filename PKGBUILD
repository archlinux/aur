# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=base16-shell-preview
pkgver=1.0.0
pkgrel=1
pkgdesc='A tool to preview and enable Base16 Shell themes in your terminal'
url='https://github.com/nvllsvm/base16-shell-preview'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/nvllsvm/base16-shell-preview/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('669351fb5317bacee61f95d19a716565adca0cd842ce7ba631cb8234e9cd53c2adead48666959621836553d1733f0d788b56520feb8689bf1d5965e7b9eb3e40')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package(){
  cd ${pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr --skip-build
}
