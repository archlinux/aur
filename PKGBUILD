pkgname=aurutils
pkgver=0.8.4
pkgrel=1
pkgdesc='helper tools for the arch user repository'
arch=('any')
url=https://github.com/AladW/aurutils
license=('ISC')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('e1d0033cc330e1901710c7970823a9f2')
depends=('pacman>=5.0' 'git' 'jshon' 'expac' 'aria2>=1.23.0')
	 'repose' 'pacutils' 'datamash'
checkdepends=('shellcheck')
makedepends=('git')
optdepends=('devtools: build in an nspawn container'
	    'vifm: improved build file interaction')

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
