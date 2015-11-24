# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-scruffington
pkgver=0.3.1
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
md5sums=('d354ebb21ee9dea8e007ae8a3a87d10c')
sha256sums=('9b3728517fef5ae13853092e52bf55d425711b3284a0198186e58e456c1f30e1')
replaces=('python-scruffy')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
