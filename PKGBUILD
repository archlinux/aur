#Maintainer: Anton Bobrov <baverman@gmail.com>

pkgname=orcsome
pkgver=0.6
pkgrel=1
pkgdesc="A scripting extension for NETWM compliant window managers"
arch=(any)
url="https://github.com/baverman/orcsome"
license=('MIT')
groups=()
depends=('python2')
makedepends=('python2-setuptools' 'python2-cffi' 'libev' 'libx11' 'libxss' 'libxext' 'kbproto')
source=(https://github.com/baverman/orcsome/archive/$pkgver.tar.gz)
md5sums=('7f36cd3aad2f41691c689aee08ccb775')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1
}
