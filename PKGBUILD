pkgname=python-netmiko
_pkgname=netmiko
pkgver=3.3.0
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Multi-vendor library to simplify Paramiko SSH connections to network devices"
arch=('any')
url="https://github.com/ktbyers/netmiko"
license=('MIT')
depends=('python' 'python-paramiko' 'python-scp' 'python-pyserial' 'python-textfsm')
makedepends=('python-setuptools')
source=("${url}/archive/${_pkgver}.tar.gz")
sha256sums=('2ff7c88b00ed50259f210af6d7bf3bbc5d4f486c2173051f6933fb444dfec961')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
