# Maintainer: otaj

pkgname=python-kornia
_name=kornia
pkgver=0.2.1
pkgrel=1
arch=(any)
url='https://github.com/kornia/kornia'
pkgdesc='Open Source Differentiable Computer Vision Library for PyTorch'
license=(Apache)
makedepends=('python-setuptools')
depends=('python-pytorch' 'python-torchvision' 'opencv' 'python-matplotlib' 'ipython' 'jupyter')
checkdepends=('python-pytest')
options=(!emptydirs)
source=(${_name}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('95eb4c5f84325e4fff887ef1a8a9f8aeb634bd014031e0c3c08bcd18a5d3cd24')

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  pytest 
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
