pkgname=aurutils
pkgver=1.1.2
pkgrel=1
pkgdesc='helper tools for the arch user repository'
arch=('any')
url=https://github.com/AladW/aurutils
license=('ISC')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('076edd83cb0153bb498bb29839102c578f0e8f36b839815867586fb89a131c65')
depends=('pacman>=5' 'expac>=7' 'aria2>=1.23' 'git' 'jshon'
	 'repose' 'pacutils')
checkdepends=('shellcheck')
makedepends=('git')
optdepends=('devtools: build in an nspawn container'
	    'vifm: improved build file interaction'
	    'datamash: check tsort input')

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
