# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=importlab

pkgname=python-importlab
pkgver=0.1.1
pkgrel=1
pkgdesc="A library to calculate python dependency graphs."
arch=('any')
url="https://github.com/google/importlab"
license=('APACHE')
depends=('python-networkx' 'python-six')
makedepends=('python' 'python-setuptools')
options=(!emptydirs)
source=("https://github.com/google/importlab/archive/${pkgver}.tar.gz")
sha256sums=('04360e2b07b2d26d25710f8b91466554b55ff23a40887658ce5b423cc25053ff')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
