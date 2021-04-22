# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=sanic-jinja2
pkgdesc='Jinja2 support for sanic'
pkgver=0.9.0
pkgrel=1
arch=('x86_64')
license=('BSD-3-Clause License')
url='https://github.com/lixxu/sanic-jinja2'
depends=()
# makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lixxu/sanic-jinja2/archive/$pkgver.tar.gz")
sha256sums=('a071ba79b06f9b74218e1b371a7b039a30ec2b84735f8fed57f9160e04503f45')

build() {
  cd $pkgname-$pkgver
  
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
