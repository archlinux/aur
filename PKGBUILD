# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname='python-apscheduler'
_pkgname=APScheduler
pkgver=3.6.3
pkgrel=3
pkgdesc='A light but powerful in-process task scheduler'
arch=(any)
url=http://pypi.python.org/pypi/APScheduler
license=(MIT)
depends=(
  'python-six'
  'python-pytz'
  'python-tzlocal'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/A/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('3bb5229eed6fbbdafc13ce962712ae66e175aa214c69bed35a06bffcf0c5e244')

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-apscheduler/LICENSE.txt"
}
