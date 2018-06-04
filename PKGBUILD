# Contributor: Felix Yan <felixonmars@gmail.com>
 
pkgname=libxtract-git
_gitname=LibXtract
pkgver=0.282.7aa96fa
pkgrel=1
pkgdesc='simple, portable, lightweight library of audio feature extraction functions'
url='https://github.com/jamiebullock/LibXtract'
arch=('i686' 'x86_64')
license=('custom')
depends=('glibc')
makedepends=('git')
provides=('libxtract')
conflicts=('libxtract')
source=("git://github.com/jamiebullock/LibXtract.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$_gitname"
  make LIBRARY=shared
}

package () {
  cd "$_gitname"
  make PREFIX="$pkgdir/usr" LIBRARY=shared install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

