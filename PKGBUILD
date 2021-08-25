# Maintainer  : Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=ospd
pkgver=21.4.3
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
sha512sums=('551c4243eb9e8ee667eec4ee91259465b66353c70741602304faab94041ec144b1cc082ead7383a2d58bf3812a3e965568cd826e8a34152fc87680a049af4f5e')

check() {
  cd "$srcdir/$pkgname-$pkgver"
    LANG=en_US.UTF-8 pytest
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
