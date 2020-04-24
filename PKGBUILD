# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=weboob-qt
pkgver=2.0
pkgrel=1
pkgdesc="Weboob is a project which provides a core library, modules and applications (QT apps)"
arch=('any')
url="https://weboob.org"
license=('LGPL-3.0+')
install='weboob.install'
depends=('weboob'
         'python-pyqt5')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/b5/e5/98adb98776803b4ed49f78edd4737162303b7558ab971d2220722c7cb552/weboob-qt-${pkgver}.tar.gz")
md5sums=('fe4eb4478b2b08298acc874501595cac')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  rm -rf "${pkgdir}/usr/share/man"
  rm ${pkgdir}/usr/lib/python3.8/site-packages/weboob/__init__.py
  rm ${pkgdir}/usr/lib/python3.8/site-packages/weboob/__pycache__/__init__.cpython-38.opt-1.pyc
  rm ${pkgdir}/usr/lib/python3.8/site-packages/weboob/__pycache__/__init__.cpython-38.pyc
  rm ${pkgdir}/usr/lib/python3.8/site-packages/weboob/applications/__init__.py
  rm ${pkgdir}/usr/lib/python3.8/site-packages/weboob/applications/__pycache__/__init__.cpython-38.opt-1.pyc
  rm ${pkgdir}/usr/lib/python3.8/site-packages/weboob/applications/__pycache__/__init__.cpython-38.pyc
  rm ${pkgdir}/usr/lib/python3.8/site-packages/weboob/tools/__init__.py
  rm ${pkgdir}/usr/lib/python3.8/site-packages/weboob/tools/__pycache__/__init__.cpython-38.opt-1.pyc
  rm ${pkgdir}/usr/lib/python3.8/site-packages/weboob/tools/__pycache__/__init__.cpython-38.pyc
  rm ${pkgdir}/usr/lib/python3.8/site-packages/weboob/tools/application/__init__.py
  rm ${pkgdir}/usr/lib/python3.8/site-packages/weboob/tools/application/__pycache__/__init__.cpython-38.opt-1.pyc
  rm ${pkgdir}/usr/lib/python3.8/site-packages/weboob/tools/application/__pycache__/__init__.cpython-38.pyc
}