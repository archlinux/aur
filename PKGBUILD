pkgname=pycp
pkgver="8.0.8"
pkgrel=1
pkgdesc="cp and mv with a progressbar"
url="http://github.com/dmerejkowsky/pycp"
arch=('any')
license=('MIT')
depends=('python' 'python-attrs')
makedepends=('python' 'python-setuptools')
source=('https://files.pythonhosted.org/packages/0f/b2/b9d28d96d5760afb002de5aec697d4bfa3b70b376f70758ba755b826157a/pycp-8.0.8.tar.gz')
checkdepends=('python-pytest' 'python-pytest-mock')

md5sums=('83ef70e34cf3fcd408381ab3b5ff422a')


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
