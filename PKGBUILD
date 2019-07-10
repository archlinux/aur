# Maintainer: otaj
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python-mnist
pkgdesc="Python utilities to download and parse the MNIST dataset"
pkgname=(python-mnist python2-mnist)
pkgver=0.2.2
pkgrel=1
arch=(any)
url='https://github.com/datapythonista/mnist'
license=(BSD3)
makedepends=(
  'python-setuptools'
  'python2-setuptools'
)
options=(!emptydirs)
source=("https://github.com/datapythonista/mnist/archive/mnist-${pkgver}.tar.gz")
sha256sums=('f779d6b11d0aa7617b648b3579f010951d41fd30de7b4e2d7570f434529dce52')

package_python-mnist() {
depends=('python-numpy')
  cd "${srcdir}/mnist-mnist-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-mnist() {
depends=('python2-numpy')
  cd "${srcdir}/mnist-mnist-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
