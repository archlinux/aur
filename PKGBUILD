# Contributor: Richard PALO <richard.palo@free.fr>
# Contributor: Florian Walch <florian.walch@gmx.at>
# Maintainer: Robin Baumgartner <robin@baumgartners.ch>
pkgname=python-relatorio
pkgver=0.10.0
pkgrel=2
pkgdesc="A templating library able to output odt and pdf files"
arch=('any')
url="http://relatorio.tryton.org/"
license=('GPL')
depends=('python>=3.5')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/r/relatorio/relatorio-$pkgver.tar.gz")
sha512sums=('a154e1b462526f298c0a931e7e78ddcc3fbf3744a1a129a346e442502c3f056b87cc5b94f9c8375b32954755f9e0a6cb94ece83671fd77f2473e98d2a0ec42b1')

build() {
  cd "$srcdir/relatorio-$pkgver"
  python setup.py build
}

package_python-relatorio() {
  depends=('python-genshi>=0.5' 'python-lxml>=2.0')
  optdepends=('python-pycha>=0.4.0: chart support' 'python-yaml' 'python-magic: fodt support')

  cd "$srcdir/relatorio-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
