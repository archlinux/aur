# $Id$
# Maintainer: Andrea Ratto <andrearatto_liste@yahoo.it>

pkgname=ccm
pkgver=2.0.3
pkgrel=1
pkgdesc="Cassandra Cluster Manager"
arch=('any')
license=('Apache')
url="https://github.com/pcmanus/ccm"
makedepends=('python-setuptools' 'python-yaml' 'python-six' 'git'
             'python-psutil' 'apache-ant' 'java-environment')
checkdepends=()
source=("git+https://github.com/pcmanus/ccm.git#tag=ccm-$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

check() {
  cd "$srcdir/$pkgname"
  mkdir -p 'test-dir'
  # Skipping long tests
  # python setup.py test
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

