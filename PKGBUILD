# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-imagededup
pkgver=0.2.4
pkgrel=1
pkgdesc='Finding duplicate images made easy'
arch=('x86_64')
url='https://idealo.github.io/imagededup'
license=('Apache')
depends=('python'
         'python-numpy'
         'python-pillow'
         'python-scipy'
         'python-tensorflow'
         'python-tqdm'
         'python-scikit-learn'
         'python-matplotlib'
         'python-pywavelets')
makedepends=('python-setuptools' 'cython')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/idealo/imagededup/archive/v${pkgver}.tar.gz")
sha256sums=('ec8b4d5bd23b50fdf12e3dea5eb680b6852cea13fea3a3ec506098ea91b54c24')

build() {
  cd "imagededup-${pkgver}"
  python setup.py build
}

package() {
  cd "imagededup-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
