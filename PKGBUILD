# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-scruffy
pkgver=0.3.1
pkgrel=1
pkgdesc="Handles the loading and management of configuration files, plugins, and other filesystem resources such as temporary files and directories, log files, etc"
arch=('any')
depends=('python'
         'python-pyyaml'
         'python-six'
         'python-sqlalchemy')
makedepends=('python-setuptools')
url="https://github.com/snare/scruffy"
license=('Beerware')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/snare/scruffy/tar.gz/v$pkgver)
sha256sums=('fe01da3267d16b7e416697072ac25f73c36be4d32813cf1ce92a5cc845fcecf3')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
