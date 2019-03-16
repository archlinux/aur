# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=terminal-markdown-viewer
_pkgname=${pkgname//-/_}
pkgver=1.6.3
pkgrel=1
pkgdesc='Styled Terminal Markdown Viewer'
arch=('any')
url='https://github.com/axiros/terminal_markdown_viewer'
license=('BSD')
depends=('python2' 'python2-docopt' 'python2-markdown' 'python2-pyaml')
makedepends=('python2-setuptools')
checkdepends=('python2-nose')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('fdf79d4c67c5fe4b367397d9fa4d6559ff18671fc7cd88c1815b4acaf257afd5b088a37c3a09665439170dc89ce03f894b1416a28f1406591356d5d50c5eb5b9')

build() {
  cd $_pkgname-$pkgver

  python2 setup.py build
}

check() {
  cd $_pkgname-$pkgver

  python2 setup.py test
}

package() {
  cd $_pkgname-$pkgver

  python2 setup.py install --root="$pkgdir" -O1 --skip-build
}

