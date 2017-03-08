pkgname=aurutils
pkgver=1.5.1
_commit=53e4d9fa289bcb7b8cdea8da8c16e2258ad501ce
pkgrel=1
pkgdesc='helper tools for the arch user repository'
arch=('any')
url=https://github.com/AladW/aurutils
license=('ISC')
depends=('pacman>=5' 'git' 'jq' 'pacutils>=0.4')
checkdepends=('shellcheck')
makedepends=('git')
optdepends=('devtools: systemd-nspawn support'
            'vifm: build file interaction'
            'aria2: threaded downloads'
            'parallel: threaded downloads'
            'expac: aursift script'
            'repose: repo-add alternative')
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
