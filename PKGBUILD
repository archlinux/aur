# Maintainer: Alad Wenter <alad@mailbox.org>
pkgname=aurutils
pkgver=1.5.3
pkgrel=3
pkgdesc='helper tools for the arch user repository'
arch=('any')
url='https://github.com/AladW/aurutils'
license=('ISC')
depends=('pacman>=5' 'git' 'jq' 'pacutils>=0.4')
makedepends=('git')
optdepends=('devtools: systemd-nspawn support'
            'vifm: build file interaction'
            'aria2: threaded downloads'
            'parallel: threaded downloads'
            'expac: aursift script'
            'repose: repo-add alternative')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/$pkgver/$pkgver.tar.gz.asc")
sha256sums=('a09088a460e352179dbf799d915e866af47aa280474a9c943f8e6885490734c5'
            'SKIP')
# Alad Wenter <alad@mailbox.org>
validpgpkeys=('DBE7D3DD8C81D58D0A13D0E76BC26A17B9B7018A')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
