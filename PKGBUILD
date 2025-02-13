# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=base16-shell-preview
pkgver=1.0.1
pkgrel=1
pkgdesc='A tool to preview and enable Base16 Shell themes in your terminal'
url='https://github.com/nvllsvm/base16-shell-preview'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/nvllsvm/base16-shell-preview/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('65383cbe7757b929102ee8025c0de7fa2f56e53d21cd3dd92d4330b917baf9299a3cf01f6c1852050654c1a55782d750b195f094ea5dc62adf253ddce36c8146')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package(){
  cd ${pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr --skip-build
}
