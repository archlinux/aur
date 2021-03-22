# Maintainer: Paul Irofti <paul@irofti.net>

_name=sel4-deps
pkgname="python-$_name"
pkgver=0.3.1
pkgrel=1

pkgdesc="metapackage for build dependencies for the seL4 microkernel"
arch=('any')
url="https://sel4.systems/"
license=('BSD')

depends=('python'
  'python-six'
  'python-future'
  'python-jinja'
  'python-lxml'
  'python-ply'
  'python-psutil'
  'python-bs4'
  'python-pyelftools'
  'python-sh'
  'python-pexpect'
  'python-pyaml'
  'python-jsonschema'
  'python-pyfdt'
  'cmake-format'
  'python-guardonce'
  'autopep8'
  'python-libarchive-c')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/9a/6a/0794518b4e781b584e3f91d35bb77f31ef9ee1c6c157a42354f6f7a0e547/${_name}-${pkgver}.tar.gz")
sha256sums=('b9b4a7da5dd9776c47e24dbe6eb3cdc27e7785d7e2e10b5bb78ab3c41ed9b227')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
