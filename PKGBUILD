# Maintainer: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Kevin Puertas <kevinpr@jkanetwork.com>

_name=dnsrecon
pkgname=python-dnsrecon
pkgver=1.1.5
pkgrel=1
pkgdesc='A DNS Enumeration and Scanning tool in Python'
arch=(any)
url="https://github.com/darkoperator/dnsrecon"
license=('GNU General Public License v2.0')
depends=('python' 'python-netaddr' 'python-dnspython' 'python-lxml')
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::"https://github.com/darkoperator/$_name/archive/$pkgver.tar.gz")
sha256sums=('528881c6f2cf759ce91c895c19345768902c3fd811b05dbdfba864f5980aef9c')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package(){
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
