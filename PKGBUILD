pkgname=pycp
pkgver="8.0.7"
pkgrel=1
pkgdesc="cp and mv with a progressbar"
url="http://github.com/dmerejkowsky/pycp"
arch=('any')
license=('MIT')
depends=('python' 'python-cli-ui' 'python-attrs')
makedepends=('python' 'python-setuptools')
source=('https://files.pythonhosted.org/packages/dd/0b/bab61f6afaf10024c63728bb7179451e750283d4cf628aea3008de02e98a/pycp-8.0.7.tar.gz')
checkdepends=('python-pytest' 'python-pytest-mock')

md5sums=('15aed959fbfe1a7fe6fb516d50165c66')


build() {
  cd ${srcdir}/pycp-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/pycp-${pkgver}
  python setup.py install --root=$pkgdir/ --optimize=1

  # license
  mkdir -p $pkgdir/usr/share/licenses/pycp
  install COPYING.txt $pkgdir/usr/share/licenses/pycp/COPYING
}

# vim:set ts=2 sw=2 et:
