# Maintainer: otaj

pkgname=python-kornia
_name=kornia
pkgver=0.1.4
pkgrel=1
arch=(any)
url='https://github.com/arraiyopensource/kornia'
pkgdesc='Open Source Differentiable Computer Vision Library for PyTorch'
license=(Apache)
makedepends=('python-setuptools')
depends=('python-pytorch')
provides=('python-kornia')
conflicts=('python-kornia')
options=(!emptydirs)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a07d822876a1df067c40b35ff36c4b17d56fc90f5114a0dee54725314cecec14')


package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
