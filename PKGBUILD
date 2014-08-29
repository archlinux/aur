# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=git-bzr-kfish-git
pkgver=1.1.r62.gf798106
pkgrel=1
epoch=1
pkgdesc="a bidirectional git - bazaar gateway"
arch=('any')
url="https://github.com/kfish/git-bzr"
license=('GPL')
depends=('git' 'bzr' 'bzr-fastimport')
source=("$pkgname::git+https://github.com/kfish/git-bzr.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags|sed -r 's,^[a-zA-Z]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

package() {
  cd $pkgname
  mkdir -p "${pkgdir}/usr/bin/"
  install git-bzr "${pkgdir}/usr/bin/"
}
