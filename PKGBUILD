# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=entomologist
pkgver=1.1.2
_pkgver=27e2a66cc407e2ff2c165ad77ca6d9d88f5cd28e
pkgrel=2
pkgdesc="A desktop client for working with Bugzilla bugs across multiple trackers (Qt4)"
arch=('i686' 'x86_64')
url="https://github.com/Entomologist/entomologist"
license=('GPL2')
depends=('qt4')
source=(https://github.com/Entomologist/${pkgname}/archive/${_pkgver}.zip entomologist.install)
install=entomologist.install

build() {
  cd "$srcdir/$pkgname-$_pkgver/desktop"
  qmake-qt4
  make
}

package() {
  cd "$srcdir/$pkgname-$_pkgver/desktop"
  make INSTALL_ROOT="$pkgdir/" install
}

sha256sums=('55db365462f7eab922f612ed63cad5a09f6e1d9728841995ff96c031eb59cb87'
            '8de1709035a53742eaa08d57ce7157b171bec25fd74541ea95de1b4b35394adc')
