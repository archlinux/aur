# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-wifiwrapper
pkgname=('python-wifiwrapper' 'python2-wifiwrapper')
pkgname=python-wifiwrapper
pkgver=0.3.8
pkgrel=1
pkgdesc="Command line tool and library wrappers around iwlist and /etc/network/interfaces"
arch=(any)
url="https://pypi.python.org/pypi/wifi"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/fe/a9/d026afe8a400dd40122385cd690e4fff4d574ed16f5c3a0f5e3921bfd383/wifi-0.3.8.tar.gz")
sha256sums=('a9880b2e91ea8420154c6826c8112a2f541bbae5641d59c5cb031d27138d7f26')

package_python2-wifiwrapper() {
  depends=('python2')
  pkgdesc="Command line tool and library wrappers around iwlist and /etc/network/interfaces. (python2 version)"
  
  cd "${srcdir}/wifi-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python2-wifiwrapper"
  install -v -m644 README.rst "${pkgdir}/usr/share/doc/python2-wifiwrapper/"
}

package_python-wifiwrapper() {
  depends=('python')
  pkgdesc="Command line tool and library wrappers around iwlist and /etc/network/interfaces. (python3 version)"

  cd "${srcdir}/wifi-${pkgver}"  
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python-wifiwrapper"
  install -v -m644 README.rst "${pkgdir}/usr/share/doc/python-wifiwrapper/"
}
