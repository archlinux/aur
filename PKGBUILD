# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>

_realname=wokkel
pkgbase=python-wokkel-git
pkgname=('python-wokkel-git' 'python2-wokkel-git')
pkgver=0.7.1.r45.g9df5060
pkgrel=1
pkgdesc="Twisted Jabber support library - git version"
license=('custom:"Wokkel License"')
url="http://wokkel.ik.nu/"
source=("git+https://github.com/ralphm/wokkel")
arch=(any)
makedepends=('git' 'python-setuptools' 'python2-setuptools')

pkgver() {
  cd "$srcdir/$_realname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_python-wokkel-git() {
  depends=('python-twisted')
  conflicts=('python-wokkel' 'python-wokkel-hg')
  replaces=('python-wokkel-hg')
  provides=('python-wokkel=0.8')

  cd "$srcdir/$_realname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-wokkel-git() {
  depends=('python2-twisted')
  conflicts=('python2-wokkel' 'python2-wokkel-hg')
  replaces=('python2-wokkel-hg')
  provides=('python2-wokkel=0.8')

  cd "$srcdir/$_realname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('SKIP')
