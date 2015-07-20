# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python2-hpgl
pkgver=0.1.0
pkgrel=1
pkgdesc="Python HPGL Parsing Library"
arch=('any')
url="https://github.com/alexforencich/python-hpgl"
license=('MIT')
depends=('python2')

source=("python-hpgl-$pkgver.tar.gz::https://github.com/alexforencich/python-hpgl/archive/v$pkgver.tar.gz")
md5sums=('36b34e1ebd3ab3211ed8d625725a09c4')

build() {
  cd "$srcdir/python-hpgl-$pkgver"
  sed -i "s/'hpgl2svg/'python2-hpgl2svg/" setup.py
  sed -i "s/'hprtl2bmp/'python2-hprtl2bmp/" setup.py
}

package() {
  cd "$srcdir/python-hpgl-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

