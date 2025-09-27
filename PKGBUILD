# Maintainer: Hao Long <aur@esd.cc>

pkgname=wafw00f
pkgver=2.3.2
pkgrel=1
pkgdesc="The Web Application Firewall Fingerprinting Tool"
arch=("any")
url="https://github.com/EnableSecurity/wafw00f"
license=('BSD-3-Clause')
depends=("python-pluginbase"
         "python-requests")
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('8054b3cd6cd80963a8fcc8d4312f43ef2d22f8b8e6e85e5315f66905ef872dd8a776aa7aad89be6b1de96cb092391ac31119542a6e76d4775f9d580826282838')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
