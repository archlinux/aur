# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-pushover
pkgver=0.4
pkgrel=3
pkgdesc="Python library for Pushover notification service."
arch=('any')
url='http://pythonhosted.org/python-pushover/'
license=('GPL')
depends=('python-requests')
makedepends=('python-distribute' 'git')
source=("git+https://github.com/Thibauth/python-pushover.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgbase}"

  2to3 pushover.py
  sed -i '/2to3/d' setup.py
  python setup.py install --root=${pkgdir} 
}

# vim:set ts=2 sw=2 et:
