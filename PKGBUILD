# Maintainer: coldbug <coldBug@e.mail.de>
pkgname=python2-rdpy-git
pkgver=v1.3.2.r11.g4109b7a
pkgrel=1
pkgdesc='Remote Desktop Protocol in twisted python'
arch=(any)
url="https://github.com/citronneur/rdpy"
license=(MIT)
depends=('python2-pyopenssl' 'python2-service_identity' 'python2-twisted' 'python2-qt4reactor' 'python2-rsa' 'python2-pyasn1')
makedepends=('python2-setuptools')
optdepends=()
source=(git+https://github.com/citronneur/rdpy.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/rdpy"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/rdpy"
    python2 setup.py build
}

package() {
    cd "$srcdir/rdpy"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
