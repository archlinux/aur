# Maintainer : Achilleas Pipinellis <axil archlinux gr>
pkgname=doh-cli
pkgver=0.6
pkgrel=2
pkgdesc="a simple DNS over HTTPS query client"
arch=('any')
url="https://gitlab.com/libreops/doh-cli"
license=('GPL3')
depends=('python-setuptools' 'python-requests' 'python-dnspython')
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
sha256sums=('0107d4e669fd1a692d39ad4ddb89784d49ca097e5fb575363bd4edbbc9936fb8')
