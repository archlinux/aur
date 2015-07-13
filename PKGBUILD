# Maintainer: DerekTBrown derek@allderek.com
pkgname=phpsh
pkgver=1.3.20.g8427a3c
pkgrel=1
pkgdesc="PHPSH is a shell version of PHP"
url="http://www.phpsh.org/"
arch=('x86_64' 'i686')
depends=('readline>=6.0','python2>=2.6')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git+https://github.com/DerekTBrown/phpsh.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  sudo python2 setup.py install
}
