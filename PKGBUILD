# Maintainer: Jens John <jjohn@2ion.de>
pkgname=gien
pkgver=0.4.0
pkgrel=1
pkgdesc="Export Github issue tracker and wiki contents to local email storage"
arch=('any')
license=('GPL')
url="https://github.com/2ion/gien"
depends=(\
  'python'\
  'python-markdown'\
  'python-progressbar'\
  'python-pygithub'\
  'python-pygit2'\
  'python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/8f/4d/8bbfd93ad6064d19d2fdcd13c876be57be9061e9684d802cadc80c17e740/gien-0.4.0.tar.gz")
sha256sums=("8fb14835f206565ca5454f628904c944560a67fdc0c353a81d1e572cbcd6f29a")

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

