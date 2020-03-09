# Maintainer: Hao Long <aur@esd.cc>

pkgname=wafw00f
pkgver=2.1.0
pkgrel=1
pkgdesc="The Web Application Firewall Fingerprinting Tool"
arch=("any")
url="https://github.com/EnableSecurity/wafw00f"
license=('BSD')
provides=('wafw00f')
conflicts=('wafw00f')
depends=("python-pluginbase"
         "python-requests")
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('611efa7e21f5acd40681eb1ed83af3500bccd4764201bd3b76c23ab7a74d6a45')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
