# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-fedmsg
pkgname=('python-fedmsg' 'python2-fedmsg')
pkgver=0.18.2
pkgrel=1
pkgdesc='Utilities used around Fedora Infrastructure to send and receive messages'
arch=(any)
url='https://fedmsg.readthedocs.org/'
license=(LGPLv2)
makedeps=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/0e/59/3a085f378b6200a6b9eb6d8f42654fb35ac181e095221796d5248372eb2f/fedmsg-0.18.2.tar.gz")
sha256sums=('8f0cde1f60d32d412280599edb57b55a5aa217ff75b90867cfa5ed18b26c2703')

package_python-fedmsg() {
  pkgdesc='Utilities used around Fedora Infrastructure to send and receive messages (Python 3 version)'
  depends=('python')
  cd "fedmsg-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

package_python2-fedmsg() {
  pkgdesc='Utilities used around Fedora Infrastructure to send and receive messages (Python 2 version)'
  depends=('python2')
  cd "fedmsg-${pkgver}"

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
