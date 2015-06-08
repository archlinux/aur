pkgbase=python-lifelines
pkgname=('python-lifelines' 'python2-lifelines')
pkgver=0.7.0
pkgrel=1
pkgdesc="Survival analysis in Python"
url="http://lifelines.readthedocs.org"
arch=('i686' 'x86_64')
license=('custom')
makedepends=('python-setuptools' 'python2-setuptools')
options=('!buildflags')
source=("https://github.com/CamDavidsonPilon/lifelines/archive/v${pkgver}.tar.gz")
md5sums=('274cace9ad9e0d08df97c54448e0f7e5')

build() {
  cp -r "${srcdir}"/lifelines-$pkgver "${srcdir}"/lifelines-$pkgver-py2
  
  cd "${srcdir}"/lifelines-$pkgver
  python setup.py build

  cd "${srcdir}"/lifelines-$pkgver-py2
  python2 setup.py build
} 

package_python-lifelines() {
  depends=('python-scipy' 'python-pandas')

  cd "${srcdir}"/lifelines-$pkgver
  python setup.py install --root="${pkgdir}"
}

package_python2-lifelines() {
  depends=('python2-scipy' 'python2-pandas')

  cd "${srcdir}"/lifelines-$pkgver-py2
  python2 setup.py install --root="${pkgdir}"
}
