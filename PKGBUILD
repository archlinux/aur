# Maintainer: Hao Long <aur@esd.cc>

pkgname=wafw00f
pkgver=2.2.0
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
b2sums=('b19c29e22a3d1682595e1c6681b2046c54819f53782f45fcc707fed52fc6de0ff154b3d8151eb2a17dea7f9a5090afa68a6c171bf56d4e4823f5a7f240f07a78')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
