# Maintainer: arkhan <e@ibañez.org>

pkgname=python-xkbgroup
_name=xkbgroup
pkgver=0.2.0
pkgrel=1
pkgdesc="Query and change XKB layout state"
arch=("any")
url="https://github.com/hcpl/xkbgroup"
license=("MIT")
depends=("python")
makedepends=("python")
source=("https://github.com/hcpl/${_name}/archive/v${pkgver}.tar.gz")
md5sums=('ab49e9c66b73ae2d30d3dc17f8c8d197')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --prefix=/usr --root "${pkgdir}" || return 1
}
