# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-imagededup
pkgver=0.2.2
pkgrel=2
pkgdesc='Finding duplicate images made easy'
arch=('any')
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
sha256sums=('3e83f2931cd7e58387481a7df06e0f4ba47c80d244c31102c3cd71debbcb61f5')

build() {
  cd "imagededup-${pkgver}"
  python setup.py build
}

package() {
  cd "imagededup-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et: