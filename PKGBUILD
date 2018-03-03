# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=sshtunnel
pkgname=python-$_name
pkgver=0.1.3
pkgrel=1
pkgdesc="Pure python SSH tunnels"
arch=('any')
url="https://github.com/pahaz/sshtunnel/"
license=('MIT')
depends=('python-paramiko')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('4a6fce36dec45ebff11422565303b9c2')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
