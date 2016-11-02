# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
_name=wheezy.template

pkgname=python2-wheezy
pkgver=0.1.167
pkgrel=1
pkgdesc="wheezy.template: A lightweight template library."
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/wheezy.template"
license=('MIT')
depends=('python2>=2.0')
#source=("https://pypi.python.org/packages/source/s/$_name/$_name-$pkgver.tar.gz")
source=("https://pypi.python.org/packages/b1/67/7f0a14a4cc9bd949b8d22383c26fec83a00e7bd428e15c697f998e3e37ba/wheezy.template-0.1.167.tar.gz")
md5sums=('e02f3d36e87fe47490357193e92ad97a')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}
 
package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  chmod 755 $pkgdir/usr/lib/python2.7/site-packages/wheezy -R
}
