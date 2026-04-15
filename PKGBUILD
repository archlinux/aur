# Maintainer: Markus Näther <naether.markus@gmail.com>

pkgname=sanic-jinja2
pkgdesc='Jinja2 support for sanic'
pkgver=2022.11.11
pkgrel=1
arch=('x86_64')
license=('BSD-3-Clause License')
url='https://github.com/lixxu/sanic-jinja2'
depends=('python-sanic' 'python-jinja')
# makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lixxu/sanic-jinja2/archive/$pkgver.tar.gz")
sha256sums=('694b486c5c79cf49dbcbee153acc09c57ea9acfeb0da41718af2ed58d047fe5a')

build() {
  cd $pkgname-$pkgver
  
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
