# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=python-s3m
_name=${pkgname#python-}
_py=py3
pkgver=1.0.7
pkgrel=1
pkgdesc="SQLite3 wrapper for multithreaded Python applications"
arch=('any')
url="https://github.com/ivknv/s3m"
license=('GPL3')
depends=('python')
makedepends=('python-pip' 'python-wheel')
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/${_name}/${_name}-$pkgver-${_py}-none-any.whl")
md5sums=("c98395bb2703041511801a180297f811")
sha1sums=("87ce260f16687943cc9ffb8dff64eb0a44bdb9dc")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
