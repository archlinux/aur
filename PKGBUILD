#Maintainer: "Yannick LM <yannicklm1337 AT gmail DOT com>"

pkgname=pycp
pkgver="8.0.3"
pkgrel=1
pkgdesc="cp and mv with a progressbar"
url="http://github.com/dmerejkowsky/pycp"
arch=('any')
license=('MIT')
depends=('python' 'python-cli-ui' 'python-attrs')
makedepends=('python' 'python-setuptools')
source=('https://files.pythonhosted.org/packages/c6/99/b4cd428dbfb278e5bad2418aeba105926653da713556eac6044214ca0384/pycp-8.0.3.tar.gz')
checkdepends=('python-pytest' 'python-pytest-mock')

md5sums=('1d7f312049f5e97ea53f223e07e99175')


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
