# Maintainer: Kevin Puertas <kevinpr@jkanetwork.com>

_name=dnsrecon
pkgname=python-dnsrecon
pkgver=1.1.2
pkgrel=1
pkgdesc='A DNS Enumeration and Scanning tool in Python'
arch=(any)
url="https://github.com/darkoperator/dnsrecon"
license=('GNU General Public License v2.0')
depends=('python' 'python-netaddr')
makedepends=(python-setuptools)
source=($pkgname-$pkgver.tar.gz::"https://github.com/darkoperator/$_name/archive/$pkgver.tar.gz")
sha256sums=('2edb6435350dea05579a22635deb02719523a3389cc190dd61de310b4c9c5e86')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package(){
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
