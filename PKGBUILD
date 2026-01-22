# Maintainer: Hao Long <aur@esd.cc>

pkgname=wafw00f
pkgver=2.4.1
pkgrel=1
pkgdesc="The Web Application Firewall Fingerprinting Tool"
arch=("any")
url="https://github.com/EnableSecurity/wafw00f"
license=('BSD-3-Clause')
depends=("python-pluginbase"
         "python-requests")
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('3e42bc7f8db72320e9db5a9ca417806210b72c9627ecb9397adb3fccb2cd2fec4a083e5cb254abde7f89ab4acf1e8ef489a9db14b67dc9ab827db984d31cf93a')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
