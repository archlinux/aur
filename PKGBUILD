# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname=python-genshi
pkgver=0.7
pkgrel=1
pkgdesc="Python toolkit for stream-based generation of output for the web."
url="http://genshi.edgewall.org/"
license=("BSD")
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("http://ftp.edgewall.com/pub/genshi/Genshi-$pkgver.tar.gz")
md5sums=('54e64dd69da3ec961f86e686e0848a82')

package() {
  cd "$srcdir"/Genshi-${pkgver}

  python setup.py install --optimize=1 --root="$pkgdir"   # Native speedups will not work for python3
  install -D -m0644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
