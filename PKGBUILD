# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-scruffington
pkgver=0.3.7
pkgrel=1
pkgdesc="Handles the loading and management of configuration files, plugins, and other filesystem resources such as temporary files and directories, log files, etc"
arch=('any')
depends=('python'
         'python-six'
         'python-sqlalchemy'
         'python-yaml')
makedepends=('python-setuptools')
url="https://github.com/snare/scruffy"
license=('Beerware')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/snare/scruffy/tar.gz/v$pkgver)
md5sums=('169a8dc734bdef6d5650aaa96308d7af')
sha256sums=('43671fcc6428533e68773490eec55e54a2dd205adbbd067bb5057ddff6ed0595')

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
