# Maintainer: Max Chesterfield <`echo Y2hlc3RtMDA3QGhvdG1haWwuY29tCg== | base64 -d`>


pkgname=python-ccm-git
pkgdesc="A library to create, launch and remove an Apache Cassandra cluster on localhost."
pkgver=3.1.5
pkgrel=1
arch=('any')
license=('Apache')
depends=('python' 'python-six' 'ant' 'python-yaml' 'python-psutil')
makedepends=('python-setuptools')
checkdepends=('python-nose')
url="https://github.com/riptano/ccm/"
source=("git+https://github.com/riptano/ccm/#commit=3476c80")
md5sums=('SKIP')

check() {
  cd "$srcdir/ccm"
  nosetests
}

build() {
  cd "$srcdir/ccm"
  python setup.py build
}

package() {
  cd "$srcdir/ccm"
  python setup.py install --prefix=/usr --root="$pkgdir"
} 
