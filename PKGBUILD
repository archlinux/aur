# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname="python-okx"
pkgver=0.2.0
pkgrel=2
pkgdesc="Unofficial Python wrapper for the OKX exchange API"
arch=('any')
url="https://github.com/okxapi/$pkgname"
license=('MIT')
depends=('python-requests' 'python-pyopenssl' 'python-importlib-metadata' 'python-httpx' 'python-h2' 'python-keyring' 'python-twisted')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ec7e0da7bf5353de68e352bcbfbd0ecd90c6f118b6579351af5cda23ddb7de8e')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
