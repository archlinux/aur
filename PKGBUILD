# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-q2cli
_pkgname=q2cli
pkgver=2019.1.0
pkgrel=1
pkgdesc="Command line interface for QIIME 2"
arch=('any')
url="https://qiime2.org"
license=('BSD 3-Clause License')
depends=('python-qiime2' 'python-click')
makedepends=('python-setuptools')
source=("https://github.com/qiime2/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a69b0a16e91d15bcd30233d75a8b0709b93c3f0817a166dd99051353f8c1d3fe')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
