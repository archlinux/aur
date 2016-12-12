# Maintainer: Jens John <jjohn@2ion.de>
pkgname=gien
pkgver=0.3.2
pkgrel=3
pkgdesc="Export Github issue tracker and wiki contents to local email storage"
arch=('any')
license=('GPL')
url="https://github.com/2ion/gien"
depends=(\
  'python'\
  'python-markdown'\
  'python-progressbar'\
  'python-pygithub'\
  'python-pygit2')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/b6/8b/f60de5f8b5d01fea56e99d608cbe360f8801084fbac9a34e1c2dcf76e998/gien-${pkgver}.tar.gz")
sha256sums=("28774aa3c7269c9c30afa5ae550493acd1cdf6a696926e46dca5fa9779245bd3")

build()
{
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py build
}

package()
{
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py install -O1 --skip-build --root="$pkgdir"
}

