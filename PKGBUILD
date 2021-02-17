# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_web_shop
_name=trytond_web_shop
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module that provides a common base for webshops"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('72af6bbb93e2b50fb80c3547332f6d219f4fbac4b5ea27569ae251ef08dd5e1f')
sha512sums=('235e48125bc6c0f5cb0af10817319981461991dd8557a6da17c15195162ce54318b6cd2201c4f897899e0c2fb2e13399e497a33946b0d78dd49f189173580785')
b2sums=('91eef41ec8902935a6e7e93835c2e5fe73a85b5c7c1b8b1be16f9d9242129e57dbaeb01d3ec2b6b49ff74ae69029579034236397a1c66cddb65dfa883de45175')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
