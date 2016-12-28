pkgname=aurutils
pkgver=1.4.1
_commit=44276c2690a6f2d715f03614dd96eb9f3bfc8b8b
pkgrel=1
pkgdesc='helper tools for the arch user repository'
arch=('any')
url=https://github.com/AladW/aurutils
license=('ISC')
depends=('pacman>=5' 'expac>=7' 'git' 'jq' 'repose' 'pacutils>=0.4')
checkdepends=('shellcheck')
makedepends=('git')
optdepends=('devtools: systemd-nspawn support'
	    'vifm: build file interaction'
	    'aria2>=1.23: alternative downloader'
	    'parallel: alternative downloader'
	    'datamash: check tsort input')
source=("$pkgname-$pkgver::git+$url#commit=$_commit")
sha256sums=('SKIP')

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
