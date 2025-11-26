# Maintainer: Paul Irofti <paul@irofti.net>

_name=sel4_deps
pkgname="python-${_name/_/-}"
pkgver=0.7.0
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
  'python-beautifulsoup4'
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

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name/_/-}/${_name}-${pkgver}.tar.gz")
sha256sums=('4b7907397cadb9de8f82b192a9e695f5374c4fb4fe52ea849c93a2c3ae36fe7e')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
