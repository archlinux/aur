# Maintainer : Noah Rinehart <rinehart.noah@gmail.com>

pkgname=python2-zope-interface-git
pkgver=5.4.0
pkgrel=1
license=('ZPL')
arch=('x86_64')
url="https://pypi.python.org/pypi/zope.interface"
pkgdesc='Zope Interfaces for Python 2.x'
depends=('python2')
source=("https://pypi.io/packages/source/z/zope.interface/zope.interface-$pkgver.tar.gz")
sha512sums=('ef15d63397e05ad9fc44b2d5d786b0399b6973bb5f4866fab839ff612756f3157f2099d0f5c0469b574a5c8b5920a7c2a5c6eab8e8f84c24d5c43e816669bffe')

build() {
  cd "$srcdir"/zope.interface-$pkgver
  python2 setup.py build
}

package() {
  cd zope.interface-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

