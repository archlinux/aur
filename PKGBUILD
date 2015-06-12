# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=entomologist
pkgver=1.1.2
_pkgver=27e2a66cc407e2ff2c165ad77ca6d9d88f5cd28e
pkgrel=1
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

md5sums=('5c9fc5a16b283e83d9e714ee63123bb2'
         '0a8baf724d4c367eef70a46eb87b8d82')
sha1sums=('9476cb04f72b95547fc4c711365770d9ca06bb49'
          '21368e92101389151fa171262f5ac6106ea10ab8')
