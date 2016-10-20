# Maintainer: Wolfgang Popp <mail@wolfgang-popp.de>

pkgname=studip-sync-git
pkgver=r22.970e0a2
pkgrel=1
pkgdesc="Sync your files from Stud.IP"
arch=('any')
url="https://github.com/popeye123/studip-sync"
license=('UNLICENSE')
depends=('p7zip' 'rsync' 'curl' 'recode')
makedepends=('git')
source=("$pkgname::git+https://github.com/popeye123/studip-sync.git")
md5sums=('SKIP')
backup=('etc/studip-sync.conf.d/user.conf' 'etc/studip-sync.conf.d/courses.conf')

pkgver(){
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 755 studip-sync $pkgdir/usr/bin/studip-sync
  install -Dm 644 user.conf $pkgdir/etc/studip-sync.conf.d/user.conf
  install -Dm 644 courses.conf $pkgdir/etc/studip-sync.conf.d/courses.conf
}

# vim:set ts=2 sw=2 et:
