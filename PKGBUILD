# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_web_shortener
_name=trytond_web_shortener
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to plug a URL to an action"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c848bb3fd0847b46a1b9612bb916b31962c981360acd2967e6e8dab3f63716ba')
sha512sums=('f3b21765e006836f305cf5367d2303b80ece30dcf8f2d7128575778123d6613b99e5a6ebc662bb8b8d74eb935e3b19e18698cf434648fdd283e8e6dc9d7d10da')
b2sums=('105b9684bc0575551d38f89ed3a06958bb11f3c495086c665e4d170f5b5633023e52416c23a5ac98726559f982e711d52c9e826ca33b3fd64dc9b6b01bbe7731')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
