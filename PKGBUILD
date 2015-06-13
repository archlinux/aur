# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=aur-git
pkgver=20121208
pkgrel=1
pkgdesc='ABS-like command line tool to sync with the AUR git repository'
arch=('any')
url='https://github.com/keenerd/aur'
license=('MIT')
makedepends=('git')
source=('git://github.com/keenerd/aur.git')
md5sums=('SKIP')

_gitname='aur'

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}


package() {
  cd "$_gitname"
  install -Dm755 aur "$pkgdir/usr/bin/aur"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/aur-git/LICENSE"
} 


