# Maintainer: Nikola Milinković <nikmil@gmail.com>
# Submitter: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=python-req
pkgver=1.0.0
pkgrel=2
pkgdesc="Simple python module for loading and dumping structures in req format."
arch=(any)
url="https://github.com/absperf/python-req"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/absperf/python-req/archive/${_pkgcommit}.tar.gz")
sha256sums=('67d0bf4c210aa5028cb1de5f83dd5825bc0475617870afa599ad67ff2873b289')

package() {
  cd "${srcdir}/${pkgbase}-${_pkgcommit}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -v -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/"
}
