# Maintainer: Ersei <samb at disroot dot org>

pkgname=duolibre
pkgver=1.0.1
pkgrel=1
pkgdesc="Authenticate to Duo 2FA systems without the Duo Mobile app"
arch=('any')
url="https://github.com/evan-goode/duolibre"
license=('Unlicense')
depends=('python-pycryptodome' 'python-click' 'python-pyotp' 'python-qrcode'
         'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/14/2d/4ef947e8d74053e6dec890d7558ed86f55625a8c341969ef5bc1dc3713e6/duolibre-1.0.1.tar.gz")
sha256sums=('aa52f287a697af3143242078264620e7ce1bc0e6df4ea3a5701b28baef2d44ff')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
}
