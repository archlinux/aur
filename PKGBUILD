pkgname=aurutils
pkgver=0.9.1
pkgrel=1
pkgdesc='helper tools for the arch user repository'
arch=('any')
url=https://github.com/AladW/aurutils
license=('ISC')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('9bde7b37c18c12159d048c722e0df602e79faa2fdc75a069bc0be7eadf898201')
depends=('pacman>=5' 'expac>=7' 'aria2>=1.23' 'git' 'jshon'
	 'repose' 'pacutils' 'datamash')
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
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
