# Maintainer  : Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=ospd
pkgver=21.4.1
pkgrel=1
pkgdesc='Greenbone Open Scanner Protocol python bindings'
arch=('x86_64')
url="https://github.com/greenbone/ospd"
license=('GPL')
depends=('python-paramiko' 'python-lxml' 'python-defusedxml' 'python-pytest' 'python-deprecated' 'python-psutil')
provides=('python-ospd')
conflicts=('python-ospd')
makedepends=('python-setuptools')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/ospd/archive/v${pkgver}.tar.gz")
sha512sums=('2c9156dc79f3afd009a72b8fc0de48a2c8b3721e76840b82b27fa621f06395b0afd475cabae5c8f2ab48494dbbb2666c65fc43544342b2444ef52ceed867f707')

check() {
  cd "$srcdir/$pkgname-$pkgver"
    LANG=en_US.UTF-8 pytest
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
