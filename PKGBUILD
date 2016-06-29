pkgname=aurutils
pkgver=1.1.0
pkgrel=1
pkgdesc='helper tools for the arch user repository'
arch=('any')
url=https://github.com/AladW/aurutils
license=('ISC')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('cdfec422c7f30a74d1d27d8ad8a5af410c9d97969d3bd9cd3b902e186d98d663')
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
