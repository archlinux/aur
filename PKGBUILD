# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=termdown
pkgver=1.12.2
pkgrel=1
pkgdesc='Countdown timer and stopwatch in your terminal'
arch=('any')
url=https://github.com/trehn/termdown
license=('GPL3')
depends=('python-click' 'python-dateutil' 'python-pyfiglet')
makedepends=('python-setuptools')
optdepends=('espeak: for spoken countdown')
source=("https://files.pythonhosted.org/packages/source/t/termdown/termdown-$pkgver.tar.gz")
sha512sums=('ebed27528ab049a96fbd05108fdbfdb26673dbd7584f2a0a86516958d711e403263c3bb056b47a59a939c7b0ae025088813313c66d1220d59a7e80c3e8218257')

build() {
  cd termdown-$pkgver
  python setup.py build
}

package() {
  cd termdown-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
