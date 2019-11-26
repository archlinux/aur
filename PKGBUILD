# Maintainer: Michael Borders <michael.a.borders@gmail.com>

pkgname=python-netmiko
_pkgname=netmiko
pkgver=2.4.2
_pkgver="v${pkgver}"
pkgrel=2
pkgdesc="Multi-vendor library to simplify Paramiko SSH connections to network devices"
arch=('any')
url="https://github.com/ktbyers/netmiko"
license=('MIT')
depends=('python' 'python-paramiko' 'python-scp' 'python-pyserial' 'python-textfsm')
makedepends=('python-setuptools')
#checkdepends=('python-tox')
source=("${url}/archive/${_pkgver}.tar.gz")
sha256sums=('02f6d1eafa5588ae89a7ba01f9a0c65089aded8cfedef7bd8d61a1255bf2b4f7')

# Tests fail on python3.8 as two testing depends are not compatible yet.
#check() {
#  cd "$srcdir/$_pkgname-$pkgver"
#  tox test -e py
#}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
