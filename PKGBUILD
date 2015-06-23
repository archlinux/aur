# Maintainer: John Jekins twodopeshaggy@gmail.com
# Contributor: Mark Cornick <mcornick@mcornick.com>
# Contributor: Patrick Palka <patrick@parcs.ath.cx>

_pkgname=z
pkgname=z-git
pkgver=1.8.14.g855ca29
pkgrel=1
pkgdesc="z keeps track of where you've been and provides a convenient \
way to jump to directory that you actually use (git version)"
url="http://github.com/rupa/z"
arch=('any')
license=('WTFPL')
depends=('sh')
makedepends=('git')
source=(git://github.com/rupa/z)
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe --always | sed -e 's|-|.|g' -e 's|v||'
}

package() {
  cd $_pkgname

  install -vDm755 z.sh   "$pkgdir/usr/lib/z.sh"
  install -vDm644 z.1    "$pkgdir/usr/share/man/man1/z.1"
}
