# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=arronax
pkgver=0.7.1
pkgrel=2
pkgdesc='A program to create and modify starters/launchers (technically: .desktop files) for applications and locations (URLs).'
arch=('any')
license=('GPL3')
url="http://www.florian-diesch.de/software/arronax/"
depends=('gtk3' 'hicolor-icon-theme' 'python-gobject' 'desktop-file-utils' 'python-setuptools' 'python-xdg')
#makedepends=('python-distutils-extra')
optdepends=('python-nautilus: Arronax as Nautilus extension'
            'python-nautilus: Arronax as Caja extension'
            'nemo-python: Arronax as Nemo extension')

source=(http://www.florian-diesch.de/software/$pkgname/dist/$pkgname-$pkgver.tar.gz)

md5sums=('f8a61c58ff5b4a27b9f1ba0c5593e81c')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  /usr/bin/python setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  /usr/bin/python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

