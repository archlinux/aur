# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=base16-shell-preview
pkgver=1.1.0
pkgrel=1
pkgdesc='A tool to preview and enable Base16 Shell themes in your terminal'
url='https://github.com/nvllsvm/base16-shell-preview'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/nvllsvm/base16-shell-preview/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('918f0ddaedd9be59d0c74f00b7048c6405556c99ccaa2241caf4eed25bc61056aab11647350f6cb276d892c654a091498776f05fbfb819d479de8a5591a4ade0')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package(){
  cd ${pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr --skip-build
}
