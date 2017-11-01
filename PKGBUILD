#Maintainer: "Yannick LM <yannicklm1337 AT gmail DOT com>"

pkgname=pycp
pkgver="8.0.2"
pkgrel=1
pkgdesc="cp and mv with a progressbar"
url="http://github.com/dmerejkowsky/pycp"
arch=('any')
license=('MIT')
depends=('python' 'python-cli-ui' 'python-attrs')
makedepends=('python' 'python-setuptools')
source=('https://files.pythonhosted.org/packages/fe/76/9e01498f4fc80a990393be649d7e312cdf70384d0bdf83b3b4c2a8f7af5e/pycp-8.0.2.tar.gz')
checkdepends=('python-pytest' 'python-pytest-mock')

md5sums=('42f7632634daac104cee242fa2f06bf5')


build() {
  cd ${srcdir}/pycp-${pkgver}
  python setup.py build
}

check() {
  cd ${srcdir}/pycp-${pkgver}
  PYTHONPATH=. pytest
}

package() {
  cd ${srcdir}/pycp-${pkgver}
  python setup.py install --root=$pkgdir/ --optimize=1

  # license
  mkdir -p $pkgdir/usr/share/licenses/pycp
  install COPYING.txt $pkgdir/usr/share/licenses/pycp/COPYING
}

# vim:set ts=2 sw=2 et:
