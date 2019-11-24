# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=('python-apscheduler' 'python2-apscheduler')
_pkgname=APScheduler
pkgver=3.6.3
pkgrel=1
pkgdesc='A light but powerful in-process task scheduler'
arch=(any)
url=http://pypi.python.org/pypi/APScheduler
license=(MIT)
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/A/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('5e603880cf9ce8f4baa20a600ed1aac8')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}
}

package_python-apscheduler() {
  depends=('python-six'
           'python-pytz'
           'python-tzlocal')

  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-apscheduler/LICENSE.txt"
}

package_python2-apscheduler() {
  depends=('python2-six'
           'python2-pytz'
           'python2-tzlocal')

  cd "${_pkgname}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/python2-apscheduler/LICENSE.txt"
}
