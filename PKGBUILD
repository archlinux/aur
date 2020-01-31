# Maintainer: otaj

pkgname=python-kornia
_name=kornia
pkgver=0.2.0
pkgrel=1
arch=(any)
url='https://github.com/kornia/kornia'
pkgdesc='Open Source Differentiable Computer Vision Library for PyTorch'
license=(Apache)
makedepends=('python-setuptools')
depends=('python-pytorch' 'python-pillow' 'python-torchvision' 'opencv' 'python-matplotlib' 'ipython' 'jupyter')
options=(!emptydirs)
source=(${_name}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d1f4c34ff89b88549f7f0c3f88ea34565c3cf033fd02920f9288b28461ad331c')


package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
