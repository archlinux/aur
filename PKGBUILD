# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-scruffington
pkgver=0.3.4
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
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/snare/scruffy/tar.gz/v$pkgver)
md5sums=('8653d36e23043e7bea425ad2f50e245c')
sha256sums=('e1999ba3924657f9611f94c6f858c7eac92d754837c19eb73ac611f5ae94972b')

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
