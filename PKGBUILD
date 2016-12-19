# Maintainer: Felip Manyer i Ballester <archlinux at res hyphen telae dot cat>
# Contributor: Martin Minka <Martin dot minka at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Author: Peter Odding <peter at peterodding dot com>

pkgname=vim-session
pkgver=2.13.1
_gittag=9e9a608
pkgrel=2
pkgdesc='Extended session management for Vim (:mksession on steroids)'
provides=('vim-session')
arch=('any')
license=('MIT')
url='https://github.com/xolox/vim-session'
source=($pkgname-$pkgver.tar.gz::https://github.com/xolox/$pkgname/tarball/$pkgver)
depends=('vim-misc-xolox')
makedepends=('git')
md5sums=('f5ee5155cb5a5def14bd251fcc52f3ee')

build() {
  cd "$srcdir/xolox-$pkgname-$_gittag"
  find . -type f -name "*.md" -exec rm -f {} \;
  rm addon-info.json
  rm .gitignore
}

package() {
  cd "$srcdir/xolox-$pkgname-$_gittag"
  install -dm 755 ${pkgdir}/usr/share/vim/vimfiles/
  tar -c . | tar -x -C ${pkgdir}/usr/share/vim/vimfiles
}
