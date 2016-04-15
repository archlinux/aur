# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-scruffington
pkgver=0.3.3
pkgrel=1
pkgdesc="Handles the loading and management of configuration files, plugins, and other filesystem resources such as temporary files and directories, log files, etc"
arch=('any')
depends=('python'
         'python-yaml'
         'python-six'
         'python-sqlalchemy')
makedepends=('python-setuptools')
url="https://github.com/snare/scruffy"
license=('Beerware')
options=('!emptydirs')
source=(https://pypi.python.org/packages/source/s/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/snare/scruffy/tar.gz/v$pkgver)
md5sums=('f361647ab3a9a86c1b7246f599525b42')
sha256sums=('c90a06af72cfac394e1bd2e778b37dd4086696935c31661f716e27697cd35609')
replaces=('python-scruffy')

build() {
  cd "$srcdir/scruffy-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/scruffy-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
