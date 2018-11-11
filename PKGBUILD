# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=importlab

pkgname=python-importlab
pkgver=0.4
pkgrel=1
pkgdesc="A library to calculate python dependency graphs."
arch=('any')
url="https://github.com/google/importlab"
license=('APACHE')
depends=('python-networkx' 'python-six')
makedepends=('python' 'python-setuptools')
options=(!emptydirs)
source=(
  'https://files.pythonhosted.org/packages/eb/0b/d3473b5719888a5bb889e9559ddc040a6cf7036dfcbbf72db180716cafdc/importlab-0.4.tar.gz'
  )
sha256sums=(
  'de791a75fcf9f4b856e4bdb5c267c008f8cfb916543b34be78e331ed05ac6d36'
  )

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 CHANGELOG "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -Dm644 CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
