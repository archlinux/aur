# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Chris Warrick <aur@chriswarrick.com>

pkgname=python38-pygal
epoch=1
pkgver=3.0.0
pkgrel=1
pkgdesc='A Python SVG graph plotting library'
arch=('any')
url='https://www.pygal.org/en/stable/'
license=('LGPL3')
depends=('python38-setuptools')
optdepends=('python38-lxml: for XML output through lxml instead of xml.etree'
            'python38-cairosvg: for PNG output')
makedepends=('python38-pytest-runner')
checkdepends=('python38-pytest' 'python38-lxml' 'python38-pyquery' 'python38-cairosvg' 'python38-flask')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kozea/pygal/archive/$pkgver.tar.gz")
sha256sums=('3bcce2c8353d4b2b2a883490cc1bc50c971e5baca95fcee8ca8133b9c3f9fad6')


build() {
  cd pygal-$pkgver
  python3.8 setup.py build
}

check() {
  cd pygal-$pkgver
  pytest pygal/
}

package() {
  cd pygal-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
