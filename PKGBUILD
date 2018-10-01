# Maintainer: Wolfgang Popp <mail@wolfgang-popp.de>

pkgname=studip-sync-git
pkgver=r61.eae5ee9
pkgrel=1
pkgdesc="Sync your files from Stud.IP"
arch=('any')
url="https://github.com/woefe/studip-sync"
license=('UNLICENSE')
depends=('rsync' 'python-requests' 'python-beautifulsoup4' 'python-lxml')
makedepends=('git')
source=("$pkgname::git+https://github.com/woefe/studip-sync.git")
md5sums=('SKIP')

pkgver(){
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  python3 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
