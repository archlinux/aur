# Maintainer: Leonhard Rose<kolonigulus at gmail dot com>

_npmname=storj-cli
pkgname=$_npmname
pkgver=4.0.0
pkgrel=1
pkgdesc="Command line interface for accessing the storj Network"
arch=('any')
url="https://github.com/storj/core-cli"
license=('AGPL3')
depends=('nodejs>=6.9.1' 'python2')
makedepends=('npm' 'git>=2')
source=("https://github.com/Storj/core-cli/archive/v${pkgver}.tar.gz" 'LICENSE')
noextract=("core-cli-${pkgver}.tar.gz")
sha256sums=('SKIP'
    '76a97c878c9c7a8321bb395c2b44d3fe2f8d81314d219b20138ed0e2dddd5182')

package() {
  sudo install -D -m644 LICENSE "/usr/share/licenses/${pkgname}/LICENSE"

  cd "$srcdir"
  sudo npm install --user root -g  "v${pkgver}.tar.gz"
}
