# Maintainer: Mehmet Ozgur Bayhan <mozgurbayhan@gmail.com>

_name=timethat
pkgname=python-${_name}
pkgver=1.0.6
pkgrel=1
pkgdesc="A human friendly time calculator for functions and code blocks in Python"
arch=('i686' 'x86_64' 'armv6')
depends=('python')
makedepends=('python-setuptools')
url="https://gitlab.com/mozgurbayhan/timethat"
license=('BSD')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/t/${_name}/${_name}-$pkgver.tar.gz")

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}

md5sums=('a455a01a6d7a85194640da3b54eee303')
