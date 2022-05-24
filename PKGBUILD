# Maintainer: Nikola Milinković <nikmil@gmail.com>
# Submitter: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=python-req
pkgver=1.0.0
pkgrel=3
_pkgcommit=b003f36eff3c940ec0e3d30c823508db6ea106d7
pkgdesc="Simple python module for loading and dumping structures in req format."
arch=(any)
url="https://github.com/absperf/python-req"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/absperf/python-req/archive/${_pkgcommit}.tar.gz")
sha256sums=('2c1913b2d0b44218b1d769a66b43de03b09ec999f12787730bb9c88131b3ec6f')

package() {
  cd "${srcdir}/${pkgbase}-${_pkgcommit}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -v -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/"
}
