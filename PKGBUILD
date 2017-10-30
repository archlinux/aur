#Maintainer: "Yannick LM <yannicklm1337 AT gmail DOT com>"

pkgname=pycp
pkgver="8.0.1"
pkgrel=1
pkgdesc="cp and mv with a progressbar"
url="http://github.com/dmerejkowsky/pycp"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python' 'python-setuptools')
source=('https://files.pythonhosted.org/packages/dc/8f/a0e9dc4535fa99a5f750470de9b57a02725840855c04a68d83fee7aa7dec/pycp-8.0.1.tar.gz')
md5sums=('8b4a6b8f0ce26dfca2c9e8de914a1506')

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
