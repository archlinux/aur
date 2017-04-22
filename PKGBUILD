# Maintainer: arkhan <e@ibañez.org>

pkgname=python-xkbgroup
_name=xkbgroup
pkgver=0.1.4.3
pkgrel=1
pkgdesc="Query and change XKB layout state"
arch=("any")
url="https://github.com/hcpl/xkbgroup"
license=("MIT")
depends=("python")
makedepends=("python")
source=("https://github.com/hcpl/${_name}/archive/v${pkgver}.tar.gz"
        "$_name.patch")
md5sums=('82ed59597add176fa8b69835de83f841'
         'fb81fd181f54b9dd743d12da03f4be47')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  patch -p1 -i "$srcdir/$_name.patch"
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --prefix=/usr --root "${pkgdir}" || return 1
}

# vim:set ts=2 sw=2 et:
