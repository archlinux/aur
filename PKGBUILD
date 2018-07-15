# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=termdown
pkgver=1.14.0
pkgrel=1
pkgdesc='Countdown timer and stopwatch in your terminal'
arch=('any')
url=https://github.com/trehn/termdown
license=('GPL3')
depends=('python-click' 'python-dateutil' 'python-pyfiglet')
makedepends=('python-setuptools')
optdepends=('espeak: for spoken countdown')
source=("https://files.pythonhosted.org/packages/source/t/termdown/termdown-$pkgver.tar.gz")
sha512sums=('4b5f1548ab39c6f21e80e7cb51ebb2964f3823b74d41bcc2f7cd62baa7e619997924278484383070a44b71c39c565790968727b1b7abd95cb62f1409e13013ad')

build() {
  cd termdown-$pkgver
  python setup.py build
}

package() {
  cd termdown-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
