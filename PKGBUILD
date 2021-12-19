# Maintainer: Jens John <jjohn@2ion.de>
pkgname=gien
pkgver=0.4.2
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
source=("https://pypi.python.org/packages/d2/7a/59ce610d3026da98ccb51967ae1e041b33e542053074f510b3daf1dc92c2/gien-0.4.1.tar.gz")
sha256sums=("8986465917a7a275167b0f6cfe94951e3c8484a850ec29fdba521b25d2ff8fc5")

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

