# Maintainer: Herald Yu <yuhr123@gmail.com>
pkgname=juicefs-bin
_pkgname=juicefs
pkgver=1.2.3
_pkgver=$(echo $pkgver | sed -E 's/^([0-9\.]+)([^0-9].*)?$/\1-\2/' | sed -E 's/-$//')
pkgrel=1
pkgdesc="A distributed POSIX file system built on top of Redis and S3 (Community Edition)."
arch=('x86_64')
url="https://github.com/juicedata/juicefs"
license=('Apache')
conflicts=('juicefs')
source=("juicefs-$_pkgver.tar.gz::https://github.com/juicedata/juicefs/releases/download/v$_pkgver/juicefs-$_pkgver-linux-amd64.tar.gz")
sha256sums=('a0e4e0763ca1331e2941f43bfdefe46a728214c72b8071348f66bc21d3f14fa2')

package() {
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  ln -s /usr/bin/$_pkgname "$pkgdir"/usr/bin/mount.$_pkgname
}
