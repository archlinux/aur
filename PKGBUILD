# Maintainer: Eugene Dvoretsky <radioxoma@gmail.com>

pkgname=lsdreader
pkgver=0.2.8
pkgrel=1
pkgdesc="Decompile ABBYY Lingvo LSD dictionaries to DSL"
arch=('any')
url="https://github.com/sv99/lsdreader"
license=('unknown')
depends=('python2')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sv99/lsdreader/archive/v${pkgver}.tar.gz")
sha256sums=('5f70208533417eeaed012ad0def78543ef8afbb3f6b8babde50155c34e8154f0')

check() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py test
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
