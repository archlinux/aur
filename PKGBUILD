# Maintainer: Edvard Holst <edvard.holst at gmail> 

pkgname=tcplay-helper-git
pkgver=r26.eba59c5
pkgrel=1
pkgdesc="A helper script for mounting and unmounting tcplay containers"
arch=('any')
url="https://github.com/Zyg0te/tcplay-helper"
license=('MIT')
depends=('tcplay')
makedepends=('git')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# '$pkgname' is then checked out upon cloning, expediating versioning:
source=($pkgname::git+'https://github.com/Zyg0te/tcplay-helper.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 tcplay-helper "$pkgdir"/usr/bin/tcplay-helper
}
