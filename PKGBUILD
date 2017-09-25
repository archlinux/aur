# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=termdown
pkgver=1.12.0
pkgrel=1
pkgdesc='Countdown timer and stopwatch in your terminal'
arch=('any')
url=https://github.com/trehn/termdown
license=('GPL3')
depends=('python-click' 'python-dateutil' 'python-pyfiglet')
makedepends=('python-setuptools')
optdepends=('espeak: for spoken countdown')
source=("termdown-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d9bd6b75175352ba4dc8621f7fbfbf5380f5760418a92ed53293a6af0f9c8cf4b924438bb599d132af9c243d51736447bea05baf49bc6a9f0f7fcde2f17e79c3')

build() {
  cd termdown-$pkgver
  python setup.py build
}

package() {
  cd termdown-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
