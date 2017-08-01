# Maintainer: Daniel Landau <daniel@landau.fi>

pkgname=python2-viitenumero
pkgver=1.0
pkgrel=1
pkgdesc="Python module for generating Finnish reference numbers"
arch=('any')
url="https://github.com/codemasteroy/py-viitenumero"
license=('GPL-3')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/30/2c/250ae197446b3045f61c10210d2f5ec56d301047c2316a7414ddce7bb61d/py-viitenumero-1.0.tar.gz#md5=5b434d008846203f39a170a1708373d7"
  "viitenumero"
)
md5sums=('5b434d008846203f39a170a1708373d7'
         'c86c270102089132ab3f4e9dbe23eaee')

package() {
  cd "$srcdir/py-viitenumero-$pkgver"
  sed -i 's|python$|python2|' maksu/viitenumero.py
  python2 setup.py install --root="$pkgdir/" --optimize=0
  install -Dm755 ../viitenumero "$pkgdir/usr/bin/viitenumero"
}

