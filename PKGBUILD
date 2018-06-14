# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=python-yadisk
_name=${pkgname#python-}
_py=py3
pkgver=1.2.10
pkgrel=1
pkgdesc="Yandex.Disk REST API client library for Python"
arch=('any')
url="https://github.com/ivknv/yadisk"
license=('LGPL3')
depends=('python' 'python-requests')
makedepends=('python-pip' 'python-wheel')
source=("https://files.pythonhosted.org/packages/${_py}/${_name::1}/${_name}/${_name}-$pkgver-${_py}-none-any.whl")
sha256sums=("6c949c1574a1e343f40d53553f28e097fd5ca446f6cb0aabd0c58a659ac9bcc4")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
