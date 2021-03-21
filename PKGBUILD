# Maintainer  : Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=ospd
pkgver=20.8.2
pkgrel=2
pkgdesc='Greenbone Open Scanner Protocol python bindings'
arch=('x86_64')
url="https://github.com/greenbone/ospd"
license=('GPL')
depends=('python-paramiko' 'python-lxml' 'python-defusedxml' 'python-pytest' 'python-deprecated')
provides=('python-ospd')
conflicts=('python-ospd')
makedepends=('python-setuptools')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/ospd/archive/v${pkgver}.tar.gz")
sha512sums=('127ca6fe370faf99c9c2d2b182bb524b279d714635f367a30318acde1d383048e7a2a5e3944e83642d3963304c506fe893763b6ee78404391ead8d751c978873')

check() {
  cd "$srcdir/$pkgname-$pkgver"
    LANG=en_US.UTF-8 pytest
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
