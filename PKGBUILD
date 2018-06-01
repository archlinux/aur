# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=python-yadisk
_name=${pkgname#python-}
_py=py3
pkgver=1.2.9
pkgrel=1
pkgdesc="Yandex.Disk REST API client library for Python"
arch=('any')
url="https://github.com/ivknv/yadisk"
license=('LGPL3')
depends=('python' 'python-requests')
makedepends=('python-pip' 'python-wheel')
source=("https://files.pythonhosted.org/packages/${_py}/${_name::1}/${_name}/${_name}-$pkgver-${_py}-none-any.whl")
sha256sums=("50c28031ce0053d6f22bedf7920457c9e01aa4ec9d0dec219be4c16e3e3a8985")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
