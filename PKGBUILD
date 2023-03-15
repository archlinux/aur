pkgname=python-blosc2
_pkgname=blosc2
pkgver=2.1.1
pkgrel=1
pkgdesc='Wrapper for the blosc2 compressor'
arch=('any')
url='https://github.com/Blosc/python-blosc2'
license=('BSD')
depends=('python' 'python-setuptools' 'python-scikit-build' 'blosc2')
conflicts=('blosc2')
provides=('blosc2')
#source=("https://github.com/Blosc/python-blosc2/archive/refs/tags/v$pkgver.tar.gz") # git tarball does not contain required submodules...
source=("https://files.pythonhosted.org/packages/86/1c/f602ccfae6de9640430054c99a0e4f715134c203d7b54f482b0775289ef5/$_pkgname-$pkgver.tar.gz")
sha256sums=('b7a1bd416694fec75fcfa8f0fe64f7f0bd034d9323d8f84255ef8d239f5e002d')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-buil
}

