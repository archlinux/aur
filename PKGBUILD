# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_marketing_automation
_name=trytond_marketing_automation
pkgver=5.8.2
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to plan, coordinate and manage marketing campaigns"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8d346e2ad614abf0965d437c7c79d8e9d01fa49dc0a289c1794158f3bfe826a8')
sha512sums=('c08ce4532aa02847144d33245293f3836936649c51178a12f066fcb33021889fe201f7efa560c9561316e17b920abf6f3bc248e39102fabec2c1b1fe5078adb2')
b2sums=('201bb8734951b053bd26fa760b5eb515a44abe226a58ae70180e64a7effaad269e70641648813f8b5727d0634278978112c7e5f8f0f6f35608e2413606d3ae42')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
