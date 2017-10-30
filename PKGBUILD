#Maintainer: "Yannick LM <yannicklm1337 AT gmail DOT com>"

pkgname=pycp
pkgver="7.3.0"
pkgrel=1
pkgdesc="cp and mv with a progressbar"
url="http://github.com/dmerejkowsky/pycp"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python' 'python-setuptools')
source=("https://pypi.python.org/packages/7e/03/f4c255bf337469b3140c4dd3d7fdce2b4c2cb0a005d93b5dfd748b7f9fb2/pycp-7.3.0.tar.gz#md5=df9755749ad3d0283950ff00f3a0c273")
md5sums=('df9755749ad3d0283950ff00f3a0c273')

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
