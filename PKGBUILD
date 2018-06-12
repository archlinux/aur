# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=python-s3m
_name=${pkgname#python-}
_py=py3
pkgver=1.1.0
pkgrel=1
pkgdesc="SQLite3 wrapper for multithreaded Python applications"
arch=('any')
url="https://github.com/ivknv/s3m"
license=('GPL3')
depends=('python')
makedepends=('python-pip' 'python-wheel')
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/${_name}/${_name}-$pkgver-${_py}-none-any.whl")
sha256sums=("b5b0968b4d045e9e88defec6a0a55b64a61f58a7b68b16504ee46d5fc908fdd7")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
