pkgname=python-netmiko
_pkgname=netmiko
pkgver=3.2.0
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Multi-vendor library to simplify Paramiko SSH connections to network devices"
arch=('any')
url="https://github.com/ktbyers/netmiko"
license=('MIT')
depends=('python' 'python-paramiko' 'python-scp' 'python-pyserial' 'python-textfsm')
makedepends=('python-setuptools')
source=("${url}/archive/${_pkgver}.tar.gz")
sha256sums=('2464029a2c649846e1e6bb8d73631aca396aadfdbd91677c6501b4876706cf34')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
