# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=python2-tornadio2-git
pkgver=b463209
pkgrel=1
pkgdesc='Socket.io server implementation on top of Tornado'
arch=('any')
url='http://github.com/MrJoes/tornadio2'
license=('APACHE')
depends=('python2' 'python2-distribute' 'python2-tornado')
source=("$pkgname::git://github.com/mrjoes/tornadio2.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir/$pkgname"

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim:set ts=2 sw=2 et:
