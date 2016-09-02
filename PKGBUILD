# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-scruffington
pkgver=0.3.6
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
md5sums=('d8fb0145010fca4e15f6a32fb300a088')
sha256sums=('98b9933bbe3a642d21f2de87f392dbe1151ca63d62573634b588e02fe8ef1723')

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
