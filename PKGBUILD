# Maintainer: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-apscheduler
_pkgname=APScheduler
pkgver=3.6.0
pkgrel=1
pkgdesc='A light but powerful in-process task scheduler'
arch=(any)
url=http://pypi.python.org/pypi/APScheduler
license=(MIT)
depends=(python-six python-pytz python-tzlocal)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/A/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('75f439704fee11865432ab8f60cf4cb7')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-apscheduler/LICENSE.txt"
}
