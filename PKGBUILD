# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=termdown
pkgver=1.14.1
pkgrel=1
pkgdesc='Countdown timer and stopwatch in your terminal'
arch=('any')
url=https://github.com/trehn/termdown
license=('GPL3')
depends=('python-click' 'python-dateutil' 'python-pyfiglet')
makedepends=('python-setuptools')
optdepends=('espeak: for spoken countdown')
source=("https://files.pythonhosted.org/packages/source/t/termdown/termdown-$pkgver.tar.gz")
sha512sums=('89bcbbc17beae61ebe4e42888fd3daf1ce542351fac63d6d3bc6a8534b1c2963477249075fa26fec352bb6a489998298b51b40cd4e11398dd4e9c41069e857af')

build() {
  cd termdown-$pkgver
  python setup.py build
}

package() {
  cd termdown-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
