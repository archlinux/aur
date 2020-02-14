# Maintainer: Max Harmathy <max.harmathy@web.de>
_pkgbase=stashy
pkgbase=python-$_pkgbase
pkgname=(python-stashy python2-stashy)
pkgver=0.6
pkgrel=1
pkgdesc="Python API client for the Atlassian Stash REST API"
arch=('any')
url="https://github.com/cosmin/stashy"
license=('APACHE2')
makedepends=(
  python-mock
  python2-enum34
  python2-mock
)
source=(${url}/archive/v${pkgver}.tar.gz)
sha256sums=('eec3c4771347f620e9a7957ce8ab8b44d3a74ad9dcb9280ac6c8305e017adfe4')

package_python-stashy() {
  depends=(python-requests python-decorator)

  cd "$srcdir/$_pkgbase-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-stashy() {
  depends=(python2-requests python2-decorator)

  cd "$srcdir/$_pkgbase-$pkgver"
  /usr/bin/python2 setup.py install --root="$pkgdir/" --optimize=1
}
