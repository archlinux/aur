# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-securestring
_pipname=SecureString
pkgver=0.2
pkgrel=1
pkgdesc="Clears the contents of strings containing cryptographic material"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/dnet/pysecstr"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/S/$_pipname/$_pipname-$pkgver.tar.gz
	https://raw.githubusercontent.com/dnet/pysecstr/master/LICENSE.txt)
sha256sums=('6432f341c941731caf1f9622e2db79d10c3779c0384cc1722fc8bc9e2a203d85'
            'dd04ede42aec9ae526e6eacb8dd8319366878fd4ff2ab780049cc379f7ed7107')

build() {
  cd $_pipname-$pkgver
  python2 setup.py build
}

package() {
  cd $_pipname-$pkgver

  python2 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 ../LICENSE.txt "$pkgdir"/usr/share/licenses/python2-pathlib2/LICENSE.txt
}