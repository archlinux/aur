# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgname=('python-mbed-cloud-sdk' 'python2-mbed-cloud-sdk')
pkgver=2.2.0
pkgrel=2
pkgdesc='Pelion Device Management SDK for Python'
arch=('any')
url="https://cloud.mbed.com/"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("python-mbed-cloud-sdk-${pkgver}.tar.gz::https://github.com/ARMmbed/mbed-cloud-sdk-python/archive/${pkgver}.tar.gz")
sha256sums=('e325b9c1e7e3062e15925250702d5f31de20ecd73efab9b2b18542d8f2601a9b')

package_python-mbed-cloud-sdk() {
  depends=(
          'python'
          'python-certifi'
          'python-six'
          'python-dotenv'
          'python-future'
          'python-urllib3'
          'python-dateutil'
          'python-requests'
          'python-pytz'
  )

  cd "mbed-cloud-sdk-python-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  python setup.py clean --all
}

package_python2-mbed-cloud-sdk() {
  depends=(
          'python2'
          'python2-certifi'
          'python2-six'
          'python2-dotenv'
          'python2-future'
          'python2-urllib3'
          'python2-dateutil'
          'python2-requests'
          'python2-pytz'
  )

  cd "mbed-cloud-sdk-python-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  python2 setup.py clean --all
}

# vim:set ts=2 sw=2 et:
