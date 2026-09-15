# Maintainer: Jake Howard <aur at theorangeone dot net>
# Maintainer: Tomasz Knapik <hi@tmkn.org>
pkgname=buckup
pkgver=0.4
pkgrel=1
pkgdesc="Command line tool to create S3 buckets easily."
url="https://github.com/torchbox/buckup"
license=('BSD')
arch=('any')
depends=('python-boto3')
source=("https://github.com/torchbox/buckup/archive/v${pkgver}.tar.gz")
md5sums=('ed16dbfcab62fc31134535c47831cd9e')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  python setup.py install -O1 --skip-build --root="${pkgdir}"

  install -Dm644 README.rst "${pkgdir}"/usr/share/doc/${pkgname}/README.rst
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
